Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3619D67
	for <lists+freedreno@lfdr.de>; Fri, 10 May 2019 14:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9827489D58;
	Fri, 10 May 2019 12:46:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0886689D56
 for <freedreno@lists.freedesktop.org>; Fri, 10 May 2019 12:46:33 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id a8so5071560edx.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 May 2019 05:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NH/B2jmHFFoOn7wW07ptF8swY+sY6XpYAM+zGEB6euw=;
 b=TNjkqhZlLFU+Bcg8zhnPSDcgAJ+Qc2kOCUAODCzP+NW7bYU3HKS8eTY0SLfe8+UIHm
 jXg+vCsR8jTWfGVYqwPS6mxOG22C776mUWmyzrNcrpB2lkVeOZ7sYnZvUe04T/rq5bYP
 eYyNzhzSZ850CBNmrkR9cyQFbMqjIHzEQ8XAhMhBRnOhMQBbxdl+9P6rZ35kVR20gHi9
 CdMTc9OxeZtL7KfJNhuThXDZrdpmKt/8LBH/yQnZjUyVvxhcxdjxvUW3PF3qv2c4n7Ev
 x5IxitUwuVZn6mNxgx+DhJqNJKVsJp3VQ1E45Q8N5701sfjEhLgjSTy02ibuZ1on8Jbq
 6V6Q==
X-Gm-Message-State: APjAAAU7Oin0ylSHviAmb0DF02lJ7+s7A3/2lvyE5IOLZBJqqSAf6Zwi
 1uSog0Bk4Otzi60HZKI/9iVLPpB0MPcWiH0mkOM=
X-Google-Smtp-Source: APXvYqzZheYm+AYCCSRHn15gxu/h5Q5mj1vciXP4Qh5n40lIXEYdWdgpNqhp/uUxGCjc8l59fncbUPCJYZZFs6cw7q4=
X-Received: by 2002:a17:906:f848:: with SMTP id
 ks8mr1865618ejb.165.1557492391634; 
 Fri, 10 May 2019 05:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=kLpt5pSiy0HBoQ61LR9BGyKUq6jJrHSFE_kp4D3W8W9XVgg@mail.gmail.com>
In-Reply-To: <CAD=kLpt5pSiy0HBoQ61LR9BGyKUq6jJrHSFE_kp4D3W8W9XVgg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 May 2019 05:46:21 -0700
Message-ID: <CAF6AEGvdnO9ydtpehr0yKdFvv-9yTDRCbuLaUMu__Xma6EYmjg@mail.gmail.com>
To: Shubham Verma <shubhunic@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NH/B2jmHFFoOn7wW07ptF8swY+sY6XpYAM+zGEB6euw=;
 b=WTam/8/SxHWrB3FcC61l/ugUiNq58H3xDdMhrHin+/9h0cUY8oP14jj3Won4YHhdng
 Yzgr4FwmHUlIGvgXNmVpT3kjiPM+W9S6K5F9MNdVQZ3P2tHuPExUpfpa7N92cE3gWvJo
 67EUyK/9+7UnwPBwFufJVOqxWqA309fpuEKHBVxBWL0muVTUW6OirHO/AS2oRFsYDskE
 As6iGlwrTcw+yptzCIY8a8B5+AVkS7Fa3pvWNuxAr42tYwHwudTDTW78yVrm9RB28uSH
 j5hpzgZldadK+fF0sVbxnRJ7800LZVSZO3GjTSn6W/CNt+ScycpVaXY6yFE5EynVjcoS
 n1Uw==
Subject: Re: [Freedreno] About EVOC 2019 project ideas
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: evoc@foundation.x.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGksIGFjdHVhbGx5IHRoZSB0ZXh0dXJlIHRpbGluZyBwcm9qZWN0IHdhcyBzZWxlY3RlZCBmb3Ig
YSBHU29DCnByb2plY3Qgd2hpY2ggaXMganVzdCBzdGFydGluZyB1cC4uIEJ1dCB0aGVyZSBtYXkg
YmUgb3RoZXIgcHJvamVjdHMKZm9yIG90aGVyIGRyaXZlcnMgb3IgaW4gb3RoZXIgYXJlYXMgb2Yg
bWVzYS94c2VydmVyL2RybS9ldGMuICBBZGRpbmcKZXZvYyBsaXN0LgoKQlIsCi1SCgpPbiBGcmks
IE1heSAxMCwgMjAxOSBhdCA1OjQwIEFNIFNodWJoYW0gVmVybWEgPHNodWJodW5pY0BnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gSGVsbG8gRGVhciBTaXIsCj4KPiBNeSBuYW1lIGlzIFNodWJoYW0gVmVy
bWEuIEkgYW0gYSBCIHRlY2ggMm5kLXllYXIgSS5ULiBzdHVkZW50IEkgd291bGQgbGlrZSB0byBs
b29rIGludG8gd29ya2luZyB3aXRoIFguT3JnIGZvciB0aGUgRW5kbGVzcyBWYWNhdGlvbiBvZiBD
b2RlIHByb2dyYW0gMjAxOSB0aGlzIHN1bW1lci4KPgo+IEFzIHRoaXMgaXMgbXkgZmlyc3QgRVZP
QyAgSSB3YW50ZWQgdG8ga25vdyB3aGF0IG90aGVyIHRoaW5ncyBJIGhhdmUgdG8gZG8gdG8gYmUg
cGFydCBvZiBhbiBvcmdhbml6YXRpb24uCj4KPiBJIG1lbnRpb25lZCBteSBpbnRlcmVzdCBhbmQg
cHJvamVjdCBvbiB3aGljaCBJIHdhbnQgdG8gd29yayBvbiBiZWxvdywgaGF2ZSBhIGxvb2sgYXQg
dGhhdCBhbmQgdGVsbCBtZSB3aGF0IHdpbGwgYmUgZ29vZCBmb3IgbWUuIEkgd2FudCB0byB3b3Jr
IG9uIHRoZSBwcm9qZWN0IG9mIFRleHR1cmUgVGlsaW5nIGFuZCBDb21wcmVzc2VkIFRleHR1cmVz
IHVuZGVyIHRoZSBndWlkYW5jZSBvZiB5b3VycyBhbmQgSSB3YW50IHRvIGtub3cgd2hpY2ggcHJv
amVjdCBvZiBGcmVlZHJlbm8gaW4gdGhlIGlkZWFsaXN0IGlzIG5vdCBzZWxlY3RlZCBieSBhbnkg
c3R1ZGVudC4KPgo+IEkgd291bGQgYmUgZ3JhdGVmdWwgaWYgeW91IGNhbiB0ZWxsIG1lIGlmIHRo
ZXJlJ3MgYW55dGhpbmcgZWxzZSB0aGF0IEkgY291bGQgZG8gd2hpY2ggd291bGQgYmUgYXBwcmVj
aWF0ZWQuIEFueSBmdXJ0aGVyIGd1aWRhbmNlIG9yIGlucHV0cyB3b3VsZCBjZXJ0YWlubHkgYmUg
b2YgZ3JlYXQgaGVscC4KPgo+Cj4gVGhhbmsgeW91IQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gRnJlZWRyZW5vIG1haWxpbmcgbGlzdAo+IEZyZWVk
cmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9mcmVlZHJlbm8=
