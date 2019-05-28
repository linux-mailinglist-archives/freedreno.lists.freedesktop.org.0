Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2222D078
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2019 22:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E778B6E062;
	Tue, 28 May 2019 20:34:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263846E062;
 Tue, 28 May 2019 20:34:13 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D3E7360EA5; Tue, 28 May 2019 20:34:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 391A360A24;
 Tue, 28 May 2019 20:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 391A360A24
Date: Tue, 28 May 2019 14:34:08 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sean Paul <sean@poorly.run>
Message-ID: <20190528203408.GB23227@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
References: <20190528154125.GA23227@jcrouse1-lnx.qualcomm.com>
 <20190528182657.246714-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528182657.246714-1-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559075652;
 bh=3YYY/oSIJpE2sZL0TyIV1fARWnMKNlUOZvG75F73+Pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RzrmGxvagiqNUqfwHjf76dKTo+/waPySVfc3x2jau7790rueRdM6aC9/nN+Xpyjbx
 58JPOAFMFHHX5yQM4Epi2NF2mggXfR5vEUdHOT54epuwe2fTcTLOap4KjTOgc3Tprl
 E5INoQk6fvtG0wjphnBgwRoDvE2aLC9YuU0bojic=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559075651;
 bh=3YYY/oSIJpE2sZL0TyIV1fARWnMKNlUOZvG75F73+Pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E8zUtIegH/04Px9n7K9hJ0HNzItPzXZ+f06a3FgUZ8CKWjXmeDzYh7kQGfjgKJDhg
 AUXcJ9LXvq3YZhijNe4phflctA2qyLC4kTSOJcqbKxS5DjtvnZ2tHkF2VCagUnOhIY
 XR7sHjHua0q8JFdyzq2lMQTb89mcuWbabBFWv3fA=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Remove bogus comment
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
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDI6MjY6NDVQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFRoaXMgY29t
bWVudCBkb2Vzbid0IG1ha2UgYW55IHNlbnNlLCByZW1vdmUgaXQuCj4gCj4gU3VnZ2VzdGVkLWJ5
OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKClJldmlld2VkLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEu
b3JnPgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2tt
cy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gaW5kZXggODg1
YmY4OGFmYTNlLi41MGQwZTliYTVkMmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2ttcy5jCj4gQEAgLTI0Myw3ICsyNDMsNiBAQCBzdGF0aWMgaW50IF9kcHVfZGVidWdm
c19pbml0KHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQo+ICAJaWYgKElTX0VSUl9PUl9OVUxMKGVu
dHJ5KSkKPiAgCQlyZXR1cm4gLUVOT0RFVjsKPiAgCj4gLQkvKiBhbGxvdyByb290IHRvIGJlIE5V
TEwgKi8KPiAgCWRlYnVnZnNfY3JlYXRlX3gzMihEUFVfREVCVUdGU19IV01BU0tOQU1FLCAwNjAw
LCBlbnRyeSwgcCk7Cj4gIAo+ICAJZHB1X2RlYnVnZnNfZGFuZ2VyX2luaXQoZHB1X2ttcywgZW50
cnkpOwo+IC0tIAo+IFNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9t
aXVtIE9TCj4gCgotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEg
bWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3Jh
dGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVu
bw==
