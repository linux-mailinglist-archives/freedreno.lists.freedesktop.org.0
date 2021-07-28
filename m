Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679793D8502
	for <lists+freedreno@lfdr.de>; Wed, 28 Jul 2021 03:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFB96EBFF;
	Wed, 28 Jul 2021 01:02:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A496EBFF;
 Wed, 28 Jul 2021 01:02:43 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so7463274pjb.3; 
 Tue, 27 Jul 2021 18:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aWHAAuOhk3NUAyAh/B2dsoKf1PQoiLne1nY0lFgXP48=;
 b=DmyFTtUHoyY/OdcTn4Rclp495TjYNYrswlT9rvrZ47hdEV4Ey/HlabaNLrxU0t9tl/
 v43yGVFMAcPGLhC31pwve3Ue6URK8eLr4DiEHpscDklYfpHfUa3EMgaQS6mCCL3HI/KK
 muewMmPMo3/vCzMGHm2KTPiiphfHSb1UaabxepX6gYwid1VWqdA9m5j28VKJpN4x+yrv
 bSMPF4C0krWTdMa1L2OsodFSxzIzWD7MdxxlZ+WgZ6YVw4ju3kOZtHWy1BbB9FpBvcQy
 rxXHrE52698EY5f1ryVGLW67bjMLL7f7QEFVqxjOEFZNp8YppuurJhpNZsfOMr8LmEnA
 UpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWHAAuOhk3NUAyAh/B2dsoKf1PQoiLne1nY0lFgXP48=;
 b=NAydOFd8dDvDmCGraXhHQmsDF2Tcm7yX3VWsy1WLgf21COizWjx9AymctddqKsF7GX
 tLnwHY6dSP785XBBZM9tifnO1N7W3gaoTs9bUrwt+Wx1KZ6DgyF+z4mST0MA6nLPWv7O
 80PJinq9otbvDTcFbTZjZPj3JyOZN+s/1eHaA0wKrWgR57MpRIAYnt3EBrvUOTy/bnY9
 qGH/WNb8CkWIgX5fFnkcPr2iE0ql/xwpxIqn7tsZ4dIDoyJ+wCxYG4e3wR6hepDVi0sF
 BJmw7U7toBYD3Zq3r1/KNlZZIim+YbBd7cKhj4x01P99d149viYWG78mls6yQk5grO/R
 RT0A==
X-Gm-Message-State: AOAM531gI5gbigrnoDdk0gB5q3g4CpmMuzlmDNR5DN3sUgrbEisZEr8l
 M+mjihbR449LPoSbK0ngd0/2XGaacUgbsg==
X-Google-Smtp-Source: ABdhPJyvXiFvIYVjvygOXnqPubsO7UO1JJJBiEyYjSdBO23OsM8bU0Mond1RL3SJtOuYc4A2W0MJ9g==
X-Received: by 2002:a17:90a:ea12:: with SMTP id
 w18mr25376118pjy.103.1627434162969; 
 Tue, 27 Jul 2021 18:02:42 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k8sm4575643pfu.116.2021.07.27.18.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 18:06:09 -0700
Message-Id: <20210728010632.2633470-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 04/13] drm: Drop drm_gem_object_put_locked()
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKTm93IHRoYXQgbm8gb25l
IGlzIHVzaW5nIGl0LCByZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRj
bGFya0BjaHJvbWl1bS5vcmc+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgfCAyMiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgIHwgIDIgLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMjQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKaW5kZXggZDYyZmIxYTNjOTE2Li5h
MzQ1MjUzMzJiZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwpAQCAtOTczLDI4ICs5NzMsNiBAQCBkcm1fZ2VtX29i
amVjdF9mcmVlKHN0cnVjdCBrcmVmICprcmVmKQogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX29i
amVjdF9mcmVlKTsKIAotLyoqCi0gKiBkcm1fZ2VtX29iamVjdF9wdXRfbG9ja2VkIC0gcmVsZWFz
ZSBhIEdFTSBidWZmZXIgb2JqZWN0IHJlZmVyZW5jZQotICogQG9iajogR0VNIGJ1ZmZlciBvYmpl
Y3QKLSAqCi0gKiBUaGlzIHJlbGVhc2VzIGEgcmVmZXJlbmNlIHRvIEBvYmouIENhbGxlcnMgbXVz
dCBob2xkIHRoZQotICogJmRybV9kZXZpY2Uuc3RydWN0X211dGV4IGxvY2sgd2hlbiBjYWxsaW5n
IHRoaXMgZnVuY3Rpb24sIGV2ZW4gd2hlbiB0aGUKLSAqIGRyaXZlciBkb2Vzbid0IHVzZSAmZHJt
X2RldmljZS5zdHJ1Y3RfbXV0ZXggZm9yIGFueXRoaW5nLgotICoKLSAqIEZvciBkcml2ZXJzIG5v
dCBlbmN1bWJlcmVkIHdpdGggbGVnYWN5IGxvY2tpbmcgdXNlCi0gKiBkcm1fZ2VtX29iamVjdF9w
dXQoKSBpbnN0ZWFkLgotICovCi12b2lkCi1kcm1fZ2VtX29iamVjdF9wdXRfbG9ja2VkKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqKQotewotCWlmIChvYmopIHsKLQkJV0FSTl9PTighbXV0ZXhf
aXNfbG9ja2VkKCZvYmotPmRldi0+c3RydWN0X211dGV4KSk7Ci0KLQkJa3JlZl9wdXQoJm9iai0+
cmVmY291bnQsIGRybV9nZW1fb2JqZWN0X2ZyZWUpOwotCX0KLX0KLUVYUE9SVF9TWU1CT0woZHJt
X2dlbV9vYmplY3RfcHV0X2xvY2tlZCk7Ci0KIC8qKgogICogZHJtX2dlbV92bV9vcGVuIC0gdm1h
LT5vcHMtPm9wZW4gaW1wbGVtZW50YXRpb24gZm9yIEdFTQogICogQHZtYTogVk0gYXJlYSBzdHJ1
Y3R1cmUKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaCBiL2luY2x1ZGUvZHJtL2Ry
bV9nZW0uaAppbmRleCAyNDAwNDk1NjY1OTIuLjM1ZTdmNDRjMmE3NSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9kcm0vZHJtX2dlbS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaApAQCAtMzg0LDgg
KzM4NCw2IEBAIGRybV9nZW1fb2JqZWN0X3B1dChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikK
IAkJX19kcm1fZ2VtX29iamVjdF9wdXQob2JqKTsKIH0KIAotdm9pZCBkcm1fZ2VtX29iamVjdF9w
dXRfbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKLQogaW50IGRybV9nZW1faGFu
ZGxlX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKIAkJCSAgc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmosCiAJCQkgIHUzMiAqaGFuZGxlcCk7Ci0tIAoyLjMxLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5n
IGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
