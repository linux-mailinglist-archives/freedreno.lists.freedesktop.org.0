Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C149106
	for <lists+freedreno@lfdr.de>; Mon, 17 Jun 2019 22:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2108E6E090;
	Mon, 17 Jun 2019 20:13:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7446B6E08E
 for <freedreno@lists.freedesktop.org>; Mon, 17 Jun 2019 20:13:23 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id i34so7117969qta.6
 for <freedreno@lists.freedesktop.org>; Mon, 17 Jun 2019 13:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04YV4222yTbQVoaNkjtoFrmBfJ73jHzJG/awNg4EaWI=;
 b=FuZezzBvTX9jPeiNjwX6XAQrJirLyjXp/3A/l3z/L8/fvjmTIMd73/qip26epkcdXT
 Tv3b+HRmGQEPoRe5DjoGJRZrCcDxHQQ7wGlkkMlhdD+U9AjZAtNJyGvLOk6gBejsUZqH
 KHi/kITwfmyRyuNgQ9bInscHHaFWUvcdhLGraq6GWmZd27ONJ+u+AaFuQA6Q5YzuueJi
 mGVs8aCxPcdN811FikkcZczuwOOQTk5Vf8VwxjBt8U8iIps0myYDXSQeCVH65MQ8sSBp
 Vqv/xn4LHreWH4Bs/DOQYSiMSeEADWxXzlA06bTMLjnTiDJLXdSzbxVvALUR64u/PULp
 ZM+Q==
X-Gm-Message-State: APjAAAXesaagpopwGshdmRLeW7CV1+pohLv8arj6qYLLEUu1Ty6sJ0R5
 7oV4vq+rwPy7m8AIGXYKosCQSw==
X-Google-Smtp-Source: APXvYqzjE27Gg02/YlB9NekL0Cxe6H7ZZEq8eqq8VORWjDi9njYAJ+CGvuJso74VxB3+WTAYE1fXVQ==
X-Received: by 2002:aed:3ed5:: with SMTP id o21mr94179519qtf.369.1560802402527; 
 Mon, 17 Jun 2019 13:13:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:13:22 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Mon, 17 Jun 2019 16:12:50 -0400
Message-Id: <20190617201301.133275-2-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=04YV4222yTbQVoaNkjtoFrmBfJ73jHzJG/awNg4EaWI=;
 b=DXsH9rEQvO/T3DNNhX4I4Wrag8DtZOeR9pSCQJAE8tKznywa6tSYOjTPPh/4eOvwXh
 eDG92ifV/tMg6EKFPvyb5fVYFzhjrhsqpprXjmjnHKA0D7qkqRhYt/R978yc8XXe31n3
 kBxzTa4a9Q8O6XXRxKEw0HA3GIRL7nbGI5Pqh843Z/003qKq04ga+n6a8AARLQd6vtar
 nnU0or1+YVP6FgVocha9d6BYSYwJaA1sqbTp33KEhNezefxaG5zhIQAvmquL/df7/XPJ
 TNRos8HV7GhFCL1sI6WZMaWGmRo+q5ODdQSk2rkVZpd58wIol5qmkf8V6vQ+Euquf7Ib
 J28w==
Subject: [Freedreno] [PATCH 05/13] drm/msm/dsi_pll_10nm: Remove impossible
 check
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpXaGlsZSBJJ20gaW4gaGVy
ZSwgY3V0IHRoaXMgb3V0LCBwZGV2IGNhbid0IGJlIE5VTEwKClNpZ25lZC1vZmYtYnk6IFNlYW4g
UGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L3BsbC9kc2lfcGxsXzEwbm0uYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5t
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwvZHNpX3BsbF8xMG5tLmMKaW5kZXggNjE4
YjQ5ODM4MjkzLi44ZjYxMDBkYjkwZWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL3BsbC9kc2lfcGxsXzEwbm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9wbGwv
ZHNpX3BsbF8xMG5tLmMKQEAgLTgxOCw5ICs4MTgsNiBAQCBzdHJ1Y3QgbXNtX2RzaV9wbGwgKm1z
bV9kc2lfcGxsXzEwbm1faW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBpbnQgaWQp
CiAJc3RydWN0IG1zbV9kc2lfcGxsICpwbGw7CiAJaW50IHJldDsKIAotCWlmICghcGRldikKLQkJ
cmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Ci0KIAlwbGxfMTBubSA9IGRldm1fa3phbGxvYygmcGRl
di0+ZGV2LCBzaXplb2YoKnBsbF8xMG5tKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFwbGxfMTBubSkK
IAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2lu
ZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZnJlZWRyZW5v
