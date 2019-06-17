Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206FC490C4
	for <lists+freedreno@lfdr.de>; Mon, 17 Jun 2019 22:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D460E89FF7;
	Mon, 17 Jun 2019 20:04:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362BC89FF7
 for <freedreno@lists.freedesktop.org>; Mon, 17 Jun 2019 20:04:23 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d17so7409474qtj.8
 for <freedreno@lists.freedesktop.org>; Mon, 17 Jun 2019 13:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MoDrWcvfQIcbjX6EFfofy9wV3QW/5fjWQ7KMcAwGXck=;
 b=ACA3JMn0ouHNaMWJSnCj65fqph8WeFOUgUwijaXdX3GyyY/xO/CoKfp1+mSx5PLsu3
 sJDyQKPItMpTDYYk2n4AHBNgOfwtVAPZMRTol7VbbeIiqYOaTQfq+Uyl/jGYFjwTXks3
 BXmvemrCZHw4Un4ZRHklMtMXtiLi2I5T2MD/Ve7tWdRDi4VUtiPADqrimRC+ABoKI9hH
 zuBsliOd8FnpsjRwtntzslEBZrlXMexOuEMkOe87Hes2xrR+i3Xqly7A89onLvrLy/5S
 6sxTsvhDL6QWMrhhojNeh6YEwi6DvJ9rM1aUmI+Si5OC3Chlm8VXjw+lEpjXdQPQT0rA
 2Wag==
X-Gm-Message-State: APjAAAXev4PLh3vFHxf703zhtBxGrW4LKQs/uBBGbmQeu2asZYeBjuhm
 ArCjwlXneGquax/tXg0CDQ8i1A==
X-Google-Smtp-Source: APXvYqzKCGN0GuBRRJjvS3GtjbuIGUvGbilM0CRluPyrXr7aW8sG4a6kPDpW5N9YYxuzSOeFFQxsxg==
X-Received: by 2002:ac8:1796:: with SMTP id o22mr89481668qtj.98.1560801862295; 
 Mon, 17 Jun 2019 13:04:22 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id j26sm8584794qtj.70.2019.06.17.13.04.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:04:21 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Mon, 17 Jun 2019 16:03:45 -0400
Message-Id: <20190617200405.131843-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MoDrWcvfQIcbjX6EFfofy9wV3QW/5fjWQ7KMcAwGXck=;
 b=MumptO/KQTle/dU4X+lru1AwzqTHc7POxytAWgmfzMtGqNJsIhXYNDV5qaXc6Xn1TX
 1mLrzP1fnFoiY3kSI0+6YLdEnNNK1Org6t3K4fsAMyuWCsgGqoE0HHPhujrlGl7Padl2
 mvvM6Ovf231kvYoTs5CnBnorccuHuVDn5U7McUK8qGTErjFGJcqcIyf6n8kJGMUJ/P6K
 JWBPxicTjDG3AiisHnACEAnnO5XdwNIv4ZSXRJMS02tZMjSTHNygu+vKow6tKv9SwLgn
 aD5BkRWNphH5fsTEfwndhMA7NOQACUXiE8EQ+b7bqZfamXHVsYbzSIUXhZiS0DjG008+
 Iylw==
Subject: [Freedreno] [RESEND PATCH 01/13] drm/msm/dpu: Remove call to
 drm_mode_set_crtcinfo
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

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpOb3cgdGhhdCBtb2RlX2Zp
eHVwIGhhcyBiZWVuIHJlbW92ZWQsIHdlIGNhbiBqdXN0IHJlbHkgb24gdGhlIGNhbGwKZnJvbSBk
cm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoKSwKClNpZ25lZC1vZmYtYnk6
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1
X2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMK
aW5kZXggODJiZjE2ZDYxYTQ1Li45NGJhNGE1NzdlZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2VuY29kZXIuYwpAQCAtNjIyLDkgKzYyMiw2IEBAIHN0YXRpYyBpbnQg
ZHB1X2VuY29kZXJfdmlydF9hdG9taWNfY2hlY2soCiAJCX0KIAl9CiAKLQlpZiAoIXJldCkKLQkJ
ZHJtX21vZGVfc2V0X2NydGNpbmZvKGFkal9tb2RlLCAwKTsKLQogCXRyYWNlX2RwdV9lbmNfYXRv
bWljX2NoZWNrX2ZsYWdzKERSTUlEKGRybV9lbmMpLCBhZGpfbW9kZS0+ZmxhZ3MsCiAJCQlhZGpf
bW9kZS0+cHJpdmF0ZV9mbGFncyk7CiAKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIs
IEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9mcmVlZHJlbm8=
