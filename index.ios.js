/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, {Component} from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  Button,
  View,
  TouchableOpacity,
  NativeModules
} from 'react-native';
import * as globalStyles from './style.global';

const {LibraryManager} = NativeModules;

console.log(NativeModules);

export default class WritingCustomNativeModules extends Component {
  render() {
    return (
      <View style={[globalStyles.COMMON_STYLES.pageContainer, styles.container]}>
        <Button
          onPress={() => LibraryManager.selectImage()}
          title="Select Image"
          color="#841584"
          accessibilityLabel="Click to load image"
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    justifyContent: 'center',
    alignItems: 'center'
  }
});

AppRegistry.registerComponent('WritingCustomNativeModules', () => WritingCustomNativeModules);
