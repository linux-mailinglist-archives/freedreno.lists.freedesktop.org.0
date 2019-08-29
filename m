Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437DEA1AAD
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2019 15:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608D6898F3;
	Thu, 29 Aug 2019 13:05:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2108986D
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2019 13:05:00 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id y194so1134395ybe.13
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2019 06:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6VBkLsvXlERJnhRJgH+r5GK4buSUTKmrRtT/NOyzDgs=;
 b=sGBAaMEnC/vWqgCXKrCNd1cftBepV/5AVxiEeUNUlq9FUB0zefot3SLanVDY6/KZE2
 fOTUNc7uXq1CLq4zyPKEX+LAnVmPW5NEcE4Hsl4O/pGAWdun00kBtbOk/P6JD9kgtL9b
 ZbQqESvdB3UEvzU1LB3SDtmkGtIJaSiEEd2aibTBgctFY/3F9nEWe1ynxxqaw8sPCtJS
 l5JIpp4e7PWGo3h2fESGamECfq6OnkgH+YbjoGN7P5VIc4g5UOhD1EpTKJ6It/B7S2lU
 eI5BdWSMZG15mu2ZoabMp7KKS8a6w8dNF2IsVrPSLh4vGLy60ZnwR8F8LnJhuX1vYXfN
 Mqog==
X-Gm-Message-State: APjAAAVWP8aTG2Gp/jn0Q+Kszatp9t5r5frHaDF/U1ppE/OP0Ixxqiuf
 tS6DiSMwJcDud/7yU3BEc9dRzQ==
X-Google-Smtp-Source: APXvYqxnB7BRqeZ9zmDLaGZIodEN/tUWqtSFo1zTN5kxmpvBGBVy36rbhkJzx5Gc/Ud2V5aPDCW2kA==
X-Received: by 2002:a25:3441:: with SMTP id b62mr7142632yba.224.1567083900064; 
 Thu, 29 Aug 2019 06:05:00 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id t5sm455533ywi.33.2019.08.29.06.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 06:04:59 -0700 (PDT)
Date: Thu, 29 Aug 2019 09:04:59 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20190829130459.GG218215@art_vandelay>
References: <20190827213421.21917-1-robdclark@gmail.com>
 <20190827213421.21917-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827213421.21917-3-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6VBkLsvXlERJnhRJgH+r5GK4buSUTKmrRtT/NOyzDgs=;
 b=e3V0pJgx+4fsz6xIVRJ7LtRBzZ7Zb4YZnP+PLxk2w4+Z3Oll/LrQit2zb0/uy6o4GW
 Jb9sCNXWKrPdpi9zGAmgIDW8YPCN+AnJId8e4Ls8ShKj/CK0lxUSsy5U8Zqqh9rZnfmF
 DLnUr2/opNiDROP0SOrpLr46bvqRAW4Sl2ZgaAF+F14c1vBlQbY9dITPLgAfRx+hPBp3
 XHwk3h1qVFzYRfOTOaYwUVjQMY4SdWFqN9xQ9mziYgchFqHpEnX+loi73E9p9xOKc+/N
 WO91wXBImaSiBPgclAHy/bDsXBaMt831Dkw9tsHze7zljHmCOMmTdR8ZBB2ZIS7YTyfC
 FNHQ==
Subject: Re: [Freedreno] [PATCH 2/9] drm/msm/dpu: add real
 wait_for_commit_done()
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDI6MzM6MzJQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiAKPiBKdXN0IHdh
aXRpbmcgZm9yIG5leHQgdmJsYW5rIGlzbid0IGlkZWFsLi4gd2Ugc2hvdWxkIHJlYWxseSBiZSBs
b29raW5nCj4gYXQgdGhlIGh3IEZMVVNIIHJlZ2lzdGVyIHZhbHVlIHRvIGtub3cgaWYgdGhlcmUg
aXMgc3RpbGwgYW4gaW4tcHJvZ3Jlc3MKPiBmbHVzaCB3aXRob3V0IHN0YWxsaW5nIHVubmVjZXNz
YXJpbHkgd2hlbiB0aGVyZSBpcyBubyBwZW5kaW5nIGZsdXNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KClJldmlld2VkLWJ5OiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KCj4gLS0tCj4gIC4uLi9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
ZW5jb2Rlcl9waHlzX3ZpZC5jICB8IDIyICsrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c192aWQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfdmlkLmMKPiBpbmRl
eCA3MzdmZTk2M2E0OTAuLjdjNzNiMDk4OTRmMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9waHlzX3ZpZC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c192aWQuYwo+IEBAIC01MjYsNiAr
NTI2LDI2IEBAIHN0YXRpYyBpbnQgZHB1X2VuY29kZXJfcGh5c192aWRfd2FpdF9mb3JfdmJsYW5r
KAo+ICAJcmV0dXJuIF9kcHVfZW5jb2Rlcl9waHlzX3ZpZF93YWl0X2Zvcl92YmxhbmsocGh5c19l
bmMsIHRydWUpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IGRwdV9lbmNvZGVyX3BoeXNfdmlkX3dh
aXRfZm9yX2NvbW1pdF9kb25lKAo+ICsJCXN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzICpwaHlzX2Vu
YykKPiArewo+ICsJc3RydWN0IGRwdV9od19jdGwgKmh3X2N0bCA9IHBoeXNfZW5jLT5od19jdGw7
Cj4gKwlpbnQgcmV0Owo+ICsKPiArCWlmICghaHdfY3RsKQo+ICsJCXJldHVybiAwOwo+ICsKPiAr
CXJldCA9IHdhaXRfZXZlbnRfdGltZW91dChwaHlzX2VuYy0+cGVuZGluZ19raWNrb2ZmX3dxLAo+
ICsJCShod19jdGwtPm9wcy5nZXRfZmx1c2hfcmVnaXN0ZXIoaHdfY3RsKSA9PSAwKSwKPiArCQlt
c2Vjc190b19qaWZmaWVzKDUwKSk7Cj4gKwlpZiAocmV0IDw9IDApIHsKPiArCQlEUFVfRVJST1Io
InZibGFuayB0aW1lb3V0XG4iKTsKPiArCQlyZXR1cm4gLUVUSU1FRE9VVDsKPiArCX0KPiArCj4g
KwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIHZvaWQgZHB1X2VuY29kZXJfcGh5c192aWRf
cHJlcGFyZV9mb3Jfa2lja29mZigKPiAgCQlzdHJ1Y3QgZHB1X2VuY29kZXJfcGh5cyAqcGh5c19l
bmMpCj4gIHsKPiBAQCAtNjc2LDcgKzY5Niw3IEBAIHN0YXRpYyB2b2lkIGRwdV9lbmNvZGVyX3Bo
eXNfdmlkX2luaXRfb3BzKHN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzX29wcyAqb3BzKQo+ICAJb3Bz
LT5kZXN0cm95ID0gZHB1X2VuY29kZXJfcGh5c192aWRfZGVzdHJveTsKPiAgCW9wcy0+Z2V0X2h3
X3Jlc291cmNlcyA9IGRwdV9lbmNvZGVyX3BoeXNfdmlkX2dldF9od19yZXNvdXJjZXM7Cj4gIAlv
cHMtPmNvbnRyb2xfdmJsYW5rX2lycSA9IGRwdV9lbmNvZGVyX3BoeXNfdmlkX2NvbnRyb2xfdmJs
YW5rX2lycTsKPiAtCW9wcy0+d2FpdF9mb3JfY29tbWl0X2RvbmUgPSBkcHVfZW5jb2Rlcl9waHlz
X3ZpZF93YWl0X2Zvcl92Ymxhbms7Cj4gKwlvcHMtPndhaXRfZm9yX2NvbW1pdF9kb25lID0gZHB1
X2VuY29kZXJfcGh5c192aWRfd2FpdF9mb3JfY29tbWl0X2RvbmU7Cj4gIAlvcHMtPndhaXRfZm9y
X3ZibGFuayA9IGRwdV9lbmNvZGVyX3BoeXNfdmlkX3dhaXRfZm9yX3ZibGFuazsKPiAgCW9wcy0+
d2FpdF9mb3JfdHhfY29tcGxldGUgPSBkcHVfZW5jb2Rlcl9waHlzX3ZpZF93YWl0X2Zvcl92Ymxh
bms7Cj4gIAlvcHMtPmlycV9jb250cm9sID0gZHB1X2VuY29kZXJfcGh5c192aWRfaXJxX2NvbnRy
b2w7Cj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwg
R29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5v
