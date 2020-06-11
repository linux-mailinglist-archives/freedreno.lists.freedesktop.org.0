Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EDA1F6A3E
	for <lists+freedreno@lfdr.de>; Thu, 11 Jun 2020 16:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB916E2F2;
	Thu, 11 Jun 2020 14:44:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FFE6E91D
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jun 2020 14:44:42 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id n141so5789901qke.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jun 2020 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GuZ/2YfzuKQvhddD6bDELUgkTCvQFemnpB9NAFBuxW8=;
 b=LptNAwM2yvONwlkObU2zhW+2yYC8+7IIFrx8mbhfT/qdcEYMasK7jSCepxhRO8hHiK
 8KJj4NJw8PVYrs9OTq9KToZ4yA7Sh2QVwk5RapYF/XNAtrkYEsNqjrWGszgjw++dnEKC
 D6EGWXLBDtLCg+BpmnYZV2MKpMWU+8+fafQlHh4K/9Hh9gk7GLuZRLAG3DLf1kxlLUvB
 1bit8coUQd2+e9gvEo7ObPTPaf5DJBFR0BcIumLRR+iSCdfFevcgiZjwRXwyLiIOLmlP
 KraWtqt/9jffxCglG+CU+E/TMqLjZuiIX4WIyDFDbiRUswjLAdXDoySoX6+AWtShUe3x
 K32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GuZ/2YfzuKQvhddD6bDELUgkTCvQFemnpB9NAFBuxW8=;
 b=BuujKS2L9QYIBP7qPnI4l3q1kYoeJ2gyw95nTFOgAWiIfX08NP3DFzKWX5wcfMh+b2
 TEKjJBOdkf0Ef9jK2k9O+ANNvVIdbMhAbnVeb1f1XEglCT0oOsYinpA/gZOvHOhq3amC
 4wGvVfu6+yxo3WKP0lwACosSXGz11fxV5upruuMO6L+4kAUcYY6OQjbaKxLK0qwzw614
 Vkt2yyJl8ZWYfXYYznRIfwfecYxSPWlB9j9M20xSvC/JFU+O8OyaLgf3TLdrpGB48Kka
 pvv6IDyd1dWhjpFnBlDvJ5PO8N4DWr9pO3oXarqF3T1MdpeN5pIZ70WVy4j9u2SVWAoe
 Oz6A==
X-Gm-Message-State: AOAM531/zXP7aWAG00eMZELyTJ0kObRE4cXfGdKkdi0/QnrPy0FJN59X
 9PwA8FNn5JvYqkkVzqigtoJd6Q==
X-Google-Smtp-Source: ABdhPJwnR1GhPXpkQ5WmzTcWno1iYdLj+m7QDT4gQp+ZJG51SrStw9FWMxcWjwbfg9AkzzGkeZXVKA==
X-Received: by 2002:a37:aa81:: with SMTP id t123mr9052562qke.11.1591886681431; 
 Thu, 11 Jun 2020 07:44:41 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y16sm2625629qty.1.2020.06.11.07.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 07:44:40 -0700 (PDT)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
References: <20200526032235.21930-1-jonathan@marek.ca>
 <20200526032235.21930-8-jonathan@marek.ca>
 <ce713ed0-5f11-e92f-0ef4-c87690b67090@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <1109ea8b-38a5-37ea-7ed8-a4ead99658e2@marek.ca>
Date: Thu, 11 Jun 2020 10:45:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ce713ed0-5f11-e92f-0ef4-c87690b67090@linaro.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH 7/8] drm/msm/dpu: add SM8150 to hw catalog
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gNi8xMS8yMCAxMDozNyBBTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPiBPbiAyNi8wNS8y
MDIwIDA2OjIyLCBKb25hdGhhbiBNYXJlayB3cm90ZToKPj4gVGhpcyBicmluZ3MgdXAgYmFzaWMg
dmlkZW8gbW9kZSBmdW5jdGlvbmFsaXR5IGZvciBTTTgxNTAgRFBVLiBDb21tYW5kIAo+PiBtb2Rl
Cj4+IGFuZCBkdWFsIG1peGVyL2ludGYgY29uZmlndXJhdGlvbnMgYXJlIG5vdCB3b3JraW5nLCBm
dXR1cmUgcGF0Y2hlcyB3aWxsCj4+IGFkZHJlc3MgdGhpcy4gU2NhbGVyIGZ1bmN0aW9uYWxpdHkg
YW5kIG11bHRpcGxlIHBsYW5lcyBpcyBhbHNvIHVudGVzdGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKb25hdGhhbiBNYXJlayA8am9uYXRoYW5AbWFyZWsuY2E+Cj4+IC0tLQo+PiDCoCAuLi4vZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmPCoMKgwqAgfCAxNDcgKysrKysrKysr
KysrKysrKysrCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19tZHNz
LmjCoMKgIHzCoMKgIDIgKwo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE0OSBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdf
Y2F0YWxvZy5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRh
bG9nLmMKPj4gaW5kZXggMWU2NGZhMDhjMjE5Li5mOTk2MjI4NzA2NzYgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuYwo+PiBAQCAtOTAs
NiArOTAsMjMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcHVfY2FwcyBzYzcxODBfZHB1X2NhcHMg
PSB7Cj4+IMKgwqDCoMKgwqAgLnBpeGVsX3JhbV9zaXplID0gREVGQVVMVF9QSVhFTF9SQU1fU0la
RSwKPj4gwqAgfTsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHB1X2NhcHMgc204MTUwX2RwdV9j
YXBzID0gewo+PiArwqDCoMKgIC5tYXhfbWl4ZXJfd2lkdGggPSBERUZBVUxUX0RQVV9PVVRQVVRf
TElORV9XSURUSCwKPj4gK8KgwqDCoCAubWF4X21peGVyX2JsZW5kc3RhZ2VzID0gMHhiLAo+PiAr
wqDCoMKgIC5tYXhfbGluZXdpZHRoID0gNDA5NiwKPj4gK8KgwqDCoCAucXNlZWRfdHlwZSA9IERQ
VV9TU1BQX1NDQUxFUl9RU0VFRDMsCj4+ICvCoMKgwqAgLnNtYXJ0X2RtYV9yZXYgPSBEUFVfU1NQ
UF9TTUFSVF9ETUFfVjJfNSwKPiAKPiBJdCBzZWVtcyB5b3UgbWlzc2VkIHNlbmRpbmcgYSBwYXRj
aCBhZGRpbmcgc3VwcG9ydCBmb3IgCj4gRFBVX1NTUFBfU01BUlRfRE1BX1YyXzUuIENvdWxkIHlv
dSBwbGVhc2UgcG9pbnQgdG8gaXQ/Cj4gCj4gCgpUaGVyZSBhcmUgbm8gb3RoZXIgY2hhbmdlcyBy
ZWxhdGVkIHRvIHRoYXQsIHRoZSBkcml2ZXIgbmV2ZXIgY2hlY2tzIApzbWFydF9kbWFfcmV2IGFu
ZCB0aGUgY29ycmVjdCB2ZXJzaW9uIG51bWJlciBpcyBvbmx5IHNldCBmb3Igd2hlbiB0aGUgCmRy
aXZlciBzdXBwb3J0cyBpdCAoaWYgZXZlcikuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ZyZWVkcmVubwo=
