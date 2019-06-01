Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA1319CA
	for <lists+freedreno@lfdr.de>; Sat,  1 Jun 2019 07:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425E289722;
	Sat,  1 Jun 2019 05:47:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E6E89824
 for <freedreno@lists.freedesktop.org>; Sat,  1 Jun 2019 05:47:25 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x10so2345151pfi.0
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2019 22:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N4NYqP5qcFsuKou3hOU2QoLbHi9KXa2wwTKFEejFE9g=;
 b=mIaKtDiQKMkBABK+OIurpjHqlV5NOoFbJVgiazoSx2C5OBO4OHUGKqPG2Io8jp1Ts3
 B7VTND8RxpRNS4hvjImm2CnI3dpenY50975qyUO6AhPH17/3eJGWPx066i9EJBL5pwSW
 374y9VOyDDevrid0jPGaVPSenLNRfbA9RROjcHH0orvFZ5dN+TZVGVCkcln8zruH2QDe
 cqg+u/WsVyMald5X+yLUsZ8AVrfYlptWoVFcHhtKcKI7GZywamCVGqHa+hjcfg5k4SuD
 wd0ZARRhMumYYmvV1bQqw5wMUtxb14WUGxXb6whAmhSd/7R8nXAmSJSrqhXJMr6STzG/
 64Sg==
X-Gm-Message-State: APjAAAVpVF+63IYq5I3Bg5p8dVfw8kC5sDChrRsBVR7a36HAIF3sQW4O
 id2bjIlYWRvtUu/q4p/ZC25ajg==
X-Google-Smtp-Source: APXvYqyWwgqCn57/81AHKxNxBjxPxel3NYyFS7mKcCvinFDQWA3aWLt0spiLAHLYe9RqMBaXDnB0zw==
X-Received: by 2002:a05:6a00:46:: with SMTP id
 i6mr1498503pfk.173.1559368044910; 
 Fri, 31 May 2019 22:47:24 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id n21sm7833707pff.92.2019.05.31.22.47.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 May 2019 22:47:24 -0700 (PDT)
Date: Fri, 31 May 2019 22:48:04 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20190601054804.GF22737@tuxbook-pro>
References: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N4NYqP5qcFsuKou3hOU2QoLbHi9KXa2wwTKFEejFE9g=;
 b=YHiEJLdlNslOmqVxxCDPqKHWKNoy3U8FqNRl6OXkForegge1wL/cfA5vNcL0vXHSkE
 16X7UP9rxWjnITY62EyvrbyaV9fp6E7FCjytDj5vKX2kTN95rG2hjUnaqnAH4yXXzCc0
 iGd8IlCwyGAgw2dju6uBwMUTJoXf/3lU/8lFQLTwgTIJS1mYyGwf2R2IDjUov/x4Yu7m
 x0+DDkFJx5erlLm/0DbDsR9oWSayJnjv9k4S6sq5ymhUsbEZ/IX0I7MTHDZAmJeulx7B
 0HAxSc1JPDvaZvDg8sRaywaoUAh4n9RMy994KN5JDNQ0TMXoV3g8bzmvrfvUb5pvmGWg
 2IGA==
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: Ensure that the zap shader
 region is big enough
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
Cc: Kees Cook <keescook@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Mamta Shukla <mamtashukla555@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gRnJpIDMxIE1heSAxNTowOSBQRFQgMjAxOSwgSm9yZGFuIENyb3VzZSB3cm90ZToKCj4gQmVm
b3JlIGxvYWRpbmcgdGhlIHphcCBzaGFkZXIgd2Ugc2hvdWxkIGVuc3VyZSB0aGF0IHRoZSByZXNl
cnZlZCBtZW1vcnkKPiByZWdpb24gaXMgYmlnIGVub3VnaCB0byBob2xkIHRoZSBsb2FkZWQgZmls
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEu
b3JnPgoKUmV2aWV3ZWQtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFy
by5vcmc+Cgo+IC0tLQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1
LmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRy
ZW5vX2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jCj4gaW5k
ZXggNmY3ZjQxMS4uM2RiOGU0OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hZHJlbm9fZ3B1LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJl
bm9fZ3B1LmMKPiBAQCAtNjcsNyArNjcsNiBAQCBzdGF0aWMgaW50IHphcF9zaGFkZXJfbG9hZF9t
ZHQoc3RydWN0IG1zbV9ncHUgKmdwdSwgY29uc3QgY2hhciAqZnduYW1lLAo+ICAJCXJldHVybiBy
ZXQ7Cj4gIAo+ICAJbWVtX3BoeXMgPSByLnN0YXJ0Owo+IC0JbWVtX3NpemUgPSByZXNvdXJjZV9z
aXplKCZyKTsKPiAgCj4gIAkvKiBSZXF1ZXN0IHRoZSBNRFQgZmlsZSBmb3IgdGhlIGZpcm13YXJl
ICovCj4gIAlmdyA9IGFkcmVub19yZXF1ZXN0X2Z3KHRvX2FkcmVub19ncHUoZ3B1KSwgZnduYW1l
KTsKPiBAQCAtODMsNiArODIsMTMgQEAgc3RhdGljIGludCB6YXBfc2hhZGVyX2xvYWRfbWR0KHN0
cnVjdCBtc21fZ3B1ICpncHUsIGNvbnN0IGNoYXIgKmZ3bmFtZSwKPiAgCQlnb3RvIG91dDsKPiAg
CX0KPiAgCj4gKwlpZiAobWVtX3NpemUgPiByZXNvdXJjZV9zaXplKCZyKSkgewo+ICsJCURSTV9E
RVZfRVJST1IoZGV2LAo+ICsJCQkibWVtb3J5IHJlZ2lvbiBpcyB0b28gc21hbGwgdG8gbG9hZCB0
aGUgTURUXG4iKTsKPiArCQlyZXQgPSAtRTJCSUc7Cj4gKwkJZ290byBvdXQ7Cj4gKwl9Cj4gKwo+
ICAJLyogQWxsb2NhdGUgbWVtb3J5IGZvciB0aGUgZmlybXdhcmUgaW1hZ2UgKi8KPiAgCW1lbV9y
ZWdpb24gPSBtZW1yZW1hcChtZW1fcGh5cywgbWVtX3NpemUsICBNRU1SRU1BUF9XQyk7Cj4gIAlp
ZiAoIW1lbV9yZWdpb24pIHsKPiAtLSAKPiAyLjcuNAo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVu
b0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
