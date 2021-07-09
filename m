Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6110F3C2BC1
	for <lists+freedreno@lfdr.de>; Sat, 10 Jul 2021 01:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6A66E9B3;
	Fri,  9 Jul 2021 23:46:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B236E9B2
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 23:46:36 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x25so13720956lfu.13
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 16:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GR17m4TCo1bxAJbxwHuYhDUZxpveBueDWH1Tshnwhcw=;
 b=hmPlfythTE2CxjcaXjAVAWgrW2Gi2aikI45PIV7gfoj4G7M6oAEMPoirHnWK1fF1iE
 0rfo4/3xZQIb9+cs+6ntmClUn1ek8wkuiQvWcbmvMXOnVJQkWWPFYX5P76tR6llo7yq2
 R5YGjcVaF2tRv4h1oplG/+1/gGUhQ7atnCgKSIkpWsUigEGdImiRELOxKp3mWXcA+CTx
 3/ENzIMdnPfl+QViXdMA2oDoe0noNm1w1KMTN2g3X9NqdUmwTUmoBe06wME9672G7aQ8
 8oPCZxiqzPIXLR9lc334HvcNUET2CkZX0ymL8cC8ajAqq98TQBtrnJYTrOMYgecX1J4u
 JVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GR17m4TCo1bxAJbxwHuYhDUZxpveBueDWH1Tshnwhcw=;
 b=f7j5NOpg9SCb6kOioKWkt6TCyeU7uBeB+NmgodR18UcVW0/RhtnBIo709xDl6HFSRL
 Ox3J06ABLrypS/s6zjwB8Hb7Y+FnzTO3LkQ3eEyNyfdgVtPJR3zGyR8V5yghn+HO83h7
 SIPza2l3JWIqxHZuBaT3uScNPgpmbpeUelOtWj9hY9jlUluDSV9L3kD+r0YZYuORH2vb
 O5qcHForS1yOB4lZJFAWlWi4yQvuLMc9/AqaRi298DVKIApfaTiuTHZK4B6bNg3T1p9V
 Hd7JnrMQKxrVh6osg5RyEoM2BZkDgFryR69Ju6dQtX4WKjZX3Z8SD01krr2yTNJSNwYy
 pj+Q==
X-Gm-Message-State: AOAM530tlBSBKrIcNi2yQqEFYSo5TK4wNE3OMvU3OlqtXhA39P43BYp0
 J2gn2lr/GWE3PV82I+mV6ZbtSI5WnOJZiQ==
X-Google-Smtp-Source: ABdhPJwLXKpJ5yziTMVpeRJ+aJVWJpnPi6aLSogHhO7o4SSJprFYE+zfyjZMegAk5EL+0c93bLJgqA==
X-Received: by 2002:ac2:598b:: with SMTP id w11mr31398334lfn.534.1625874394692; 
 Fri, 09 Jul 2021 16:46:34 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 189sm748273ljf.117.2021.07.09.16.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 16:46:34 -0700 (PDT)
To: abhinavk@codeaurora.org
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-6-dmitry.baryshkov@linaro.org>
 <16be30732d3c2108f7a3ca640ed8285d@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2920aa33-c5cf-717f-4e6e-dfd473a87820@linaro.org>
Date: Sat, 10 Jul 2021 02:46:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <16be30732d3c2108f7a3ca640ed8285d@codeaurora.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v1 5/7] drm/msm/dp: stop calling
 set_encoder_mode callback
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMTAvMDcvMjAyMSAwMToxNiwgYWJoaW5hdmtAY29kZWF1cm9yYS5vcmcgd3JvdGU6Cj4gT24g
MjAyMS0wNy0wOCAwNToyOCwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPj4gTm9uZSBvZiB0aGUg
ZGlzcGxheSBkcml2ZXJzIG5vdyBpbXBsZW1lbnQgc2V0X2VuY29kZXJfbW9kZSBjYWxsYmFjay4K
Pj4gU3RvcCBjYWxsaW5nIGl0IGZyb20gdGhlIG1vZGVzZXQgaW5pdCBjb2RlLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+
Cj4gCj4gVGhlIGNoYW5nZSBsb29rcyBmaW5lLAo+IFJldmlld2VkLWJ5OiBBYmhpbmF2IEt1bWFy
IDxhYmhpbmF2a0Bjb2RlYXVyb3JhLm9yZz4KPiAKPiBCdXQgaGFzIERQIGJlZW4gcmUtdmVyaWZp
ZWQgd2l0aCB0aGlzIGNoYW5nZSBieSBCam9ybj8KPiBJZiBub3QsIEkgY2FuIHZlcmlmeSB0aGlz
IG9uIG15IGJvYXJkIGFuZCBnaXZlIG15IFRlc3RlZC1ieQoKUGxlYXNlIHRlc3QgaXQgb24geW91
ciBzZXR1cC4KCj4gCj4+IC0tLQo+PiDCoGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxh
eS5jIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDE4IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNw
bGF5LmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+PiBpbmRleCAw
NTFjMWJlMWRlN2UuLjcwYjMxOWE4ZmU4MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kcC9kcF9kaXNwbGF5LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9k
aXNwbGF5LmMKPj4gQEAgLTEwMiw4ICsxMDIsNiBAQCBzdHJ1Y3QgZHBfZGlzcGxheV9wcml2YXRl
IHsKPj4gwqDCoMKgwqAgc3RydWN0IGRwX2Rpc3BsYXlfbW9kZSBkcF9tb2RlOwo+PiDCoMKgwqDC
oCBzdHJ1Y3QgbXNtX2RwIGRwX2Rpc3BsYXk7Cj4+Cj4+IC3CoMKgwqAgYm9vbCBlbmNvZGVyX21v
ZGVfc2V0Owo+PiAtCj4+IMKgwqDCoMKgIC8qIHdhaXQgZm9yIGF1ZGlvIHNpZ25hbGluZyAqLwo+
PiDCoMKgwqDCoCBzdHJ1Y3QgY29tcGxldGlvbiBhdWRpb19jb21wOwo+Pgo+PiBAQCAtMjgzLDIw
ICsyODEsNiBAQCBzdGF0aWMgdm9pZCBkcF9kaXNwbGF5X3NlbmRfaHBkX2V2ZW50KHN0cnVjdAo+
PiBtc21fZHAgKmRwX2Rpc3BsYXkpCj4+IMKgfQo+Pgo+Pgo+PiAtc3RhdGljIHZvaWQgZHBfZGlz
cGxheV9zZXRfZW5jb2Rlcl9tb2RlKHN0cnVjdCBkcF9kaXNwbGF5X3ByaXZhdGUgKmRwKQo+PiAt
ewo+PiAtwqDCoMKgIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPSBkcC0+ZHBfZGlzcGxh
eS5kcm1fZGV2LT5kZXZfcHJpdmF0ZTsKPj4gLcKgwqDCoCBzdHJ1Y3QgbXNtX2ttcyAqa21zID0g
cHJpdi0+a21zOwo+PiAtCj4+IC3CoMKgwqAgaWYgKCFkcC0+ZW5jb2Rlcl9tb2RlX3NldCAmJiBk
cC0+ZHBfZGlzcGxheS5lbmNvZGVyICYmCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAga21zLT5mdW5jcy0+c2V0X2VuY29kZXJfbW9kZSkgewo+PiAtwqDCoMKgwqDCoMKgwqAga21z
LT5mdW5jcy0+c2V0X2VuY29kZXJfbW9kZShrbXMsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZHAtPmRwX2Rpc3BsYXkuZW5jb2RlciwgZmFsc2UpOwo+PiAtCj4+IC3CoMKgwqDC
oMKgwqDCoCBkcC0+ZW5jb2Rlcl9tb2RlX3NldCA9IHRydWU7Cj4+IC3CoMKgwqAgfQo+PiAtfQo+
PiAtCj4+IMKgc3RhdGljIGludCBkcF9kaXNwbGF5X3NlbmRfaHBkX25vdGlmaWNhdGlvbihzdHJ1
Y3QgZHBfZGlzcGxheV9wcml2YXRlIAo+PiAqZHAsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGhwZCkKPj4gwqB7Cj4+IEBAIC0zNjksOCAr
MzUzLDYgQEAgc3RhdGljIHZvaWQgZHBfZGlzcGxheV9ob3N0X2luaXQoc3RydWN0Cj4+IGRwX2Rp
c3BsYXlfcHJpdmF0ZSAqZHAsIGludCByZXNldCkKPj4gwqDCoMKgwqAgaWYgKGRwLT51c2JwZC0+
b3JpZW50YXRpb24gPT0gT1JJRU5UQVRJT05fQ0MyKQo+PiDCoMKgwqDCoMKgwqDCoMKgIGZsaXAg
PSB0cnVlOwo+Pgo+PiAtwqDCoMKgIGRwX2Rpc3BsYXlfc2V0X2VuY29kZXJfbW9kZShkcCk7Cj4+
IC0KPj4gwqDCoMKgwqAgZHBfcG93ZXJfaW5pdChkcC0+cG93ZXIsIGZsaXApOwo+PiDCoMKgwqDC
oCBkcF9jdHJsX2hvc3RfaW5pdChkcC0+Y3RybCwgZmxpcCwgcmVzZXQpOwo+PiDCoMKgwqDCoCBk
cF9hdXhfaW5pdChkcC0+YXV4KTsKCgotLSAKV2l0aCBiZXN0IHdpc2hlcwpEbWl0cnkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxp
bmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==
