Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CAA101043
	for <lists+freedreno@lfdr.de>; Tue, 19 Nov 2019 01:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E127D8979E;
	Tue, 19 Nov 2019 00:32:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6DC897E9
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2019 00:32:37 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k32so4730581pgl.2
 for <freedreno@lists.freedesktop.org>; Mon, 18 Nov 2019 16:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
 :user-agent:date;
 bh=o0OXgLmHTG6WHUoLd4+XFd/oiOrWoJBJ98oXwGWf49U=;
 b=miAXJ0lTpky0IUnhGM+UBY/0/D+ywmT8+lJpUWntpRW3YsyGFrg+tdTsVYHapip7sJ
 eCX6/9VpMjZ1KfG2t8s5s1jXaioLaSCPa0RAPnRXS/oBal19XAFVk8sCtoh0vNriOqPX
 M42N7YGzvsv+1shVp+Qv/63AIj271/LEDpOV6pTRcJsn8VjJU3fUReQ3fMcnh0DDc49h
 QZJwbUx+SlRcrl0K5xjuHOS1Z/4VGySPA7A3mJ29Y2vfsAv++0AqJf6n78PcH7k2q/tJ
 v4BjMi8EZqBbGptmYgscgI7dmeeu+58HNHfGtwgGTBhoiNvrZnT024TLMiDAYtYaGkXZ
 oOsA==
X-Gm-Message-State: APjAAAV9sKTOUTLvYlicZO/0OWGiEJ31Z+qen+h6hRU5mFpyG15thadK
 oQ72EmTg+mBoEy/7e7w9QUm2UQ==
X-Google-Smtp-Source: APXvYqyAKyUgyhNNCirKuH+kZ1grecYk6P0rtU1NXPsuBpylGactVDgBMuarRDsz9xu7bEt2bBE6ww==
X-Received: by 2002:a65:47c1:: with SMTP id f1mr2187675pgs.393.1574123557349; 
 Mon, 18 Nov 2019 16:32:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id d23sm23136047pfo.140.2019.11.18.16.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 16:32:36 -0800 (PST)
Message-ID: <5dd33824.1c69fb81.2d94a.4f12@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20191118234043.331542-1-robdclark@gmail.com>
References: <20191118234043.331542-1-robdclark@gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Mon, 18 Nov 2019 16:32:35 -0800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:cc:to:subject:from:user-agent:date;
 bh=o0OXgLmHTG6WHUoLd4+XFd/oiOrWoJBJ98oXwGWf49U=;
 b=M5FXXW0mR0xn+5fsbeH0ePNNujEUWE4+jL4vomKqcmMB5GfonCjRlaIdutis/H5QB3
 zAuMK1WjG32gGhpBOHHnDhMAREoTUU7xKb+mmBwWqIxeQbdzL4MQc+HxYvdIqqZ9dKnQ
 opTS860TAZBLz8BVfzAH++6rhEyMViLuHo5rU=
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: restore previous freq on
 resume
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

UXVvdGluZyBSb2IgQ2xhcmsgKDIwMTktMTEtMTggMTU6NDA6MzgpCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmggYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hNnh4X2dtdS5oCj4gaW5kZXggMzlhMjZkZDYzNjc0Li4yYWY5MWVkN2VkMGMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuaAo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmgKPiBAQCAtNjMsNiArNjMsOSBA
QCBzdHJ1Y3QgYTZ4eF9nbXUgewo+ICAgICAgICAgc3RydWN0IGNsa19idWxrX2RhdGEgKmNsb2Nr
czsKPiAgICAgICAgIHN0cnVjdCBjbGsgKmNvcmVfY2xrOwo+ICAKPiArICAgICAgIC8qIGN1cnJl
bnQgcGVyZm9ybWFuY2UgaW5kZXggc2V0IGV4dGVybmFsbHkgKi8KPiArICAgICAgIGludCBjdXJy
ZW50X3BlcmZfaW5kZXg7Cj4gKwoKSXMgdGhlcmUgYSByZWFzb24gdGhpcyBpc24ndCB1bnNpZ25l
ZD8gSXQgbG9va3MgbGlrZQpfX2E2eHhfZ211X3NldF9mcmVxKCkgdGFrZXMgYW4gaW50LCBidXQg
bWF5YmUgaXQgc2hvdWxkIHRha2UgYSB1MTYgb3IKc29tZXRoaW5nPwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApG
cmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
