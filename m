Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6238C90C
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 16:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13B56F886;
	Fri, 21 May 2021 14:18:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D3D6F5B3;
 Fri, 21 May 2021 04:16:39 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 b9-20020a17090a9909b029015cf9effaeaso6626611pjp.5; 
 Thu, 20 May 2021 21:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=WRc2dTi2j0cBWfnXOzygB7tUMf1PqONoKF2ltQXZk5A=;
 b=IK/scQupUFUmZjR7WuCGM6VOzTsQumSseCKgqsBz8Xe1hZs8LqKU6eJJK5/JbOi795
 31SOmQ/u1ZzVMIgSLlt48shW/KmfwvZZtpuj/Ak3XRva/PWAiJZNkBA0ytIj3SAus8t3
 r9h/9XecJ0H64ZTpw6hiNM0eHkCt6DiXZf2UeFPp76kYGBR9e82PPMG9FBb3pSXj2QVv
 DUIxBQstCsvASLkpBBFWy1p7/G+SvGn4wwzAYPeP9h2NAly84bTvRVfCE6x7jBI6GLot
 Jcrr2+bnrGsLIfb/48vg1jWMgN3uu04o/8+KgAFmuqszZmuXgwtVPO/yCShsqxjlkZ/U
 gz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=WRc2dTi2j0cBWfnXOzygB7tUMf1PqONoKF2ltQXZk5A=;
 b=FfzQkhfHU8aGjnz4phNRtryxv3KaiRNOyJ99LMCknHZ3MFs2DFx+ZH3CbQt2Yzwu+c
 h7kAmdeZTwpMhxXfAByUPHBMG2aIPFAGLylzdJLjOuu6fN82lCVfL9Iu8D6b4rdK1wY1
 tRF9YVIMsWTeMo/p2aVfXiIOZx4vcbjdl/2hXIYrJGNxdkiJoPTGjvCPUas9lWon4Ald
 sf8UB7u8KHz2IZ36plaAGCFzsuhyJ2vLPYGIiM5LoFrO0VWgt7vHfhFh2OVLcP+ukn28
 jmDsx/hl3vXknEkPQGtMK6aZFLI6RsMYXs+yzEAotta/nOIibXWOQI7FQ0225YogXETj
 yrFQ==
X-Gm-Message-State: AOAM53104K5Jsdwc/8aBcDc5FZL75b3ul7BeJzsjtbPttxl4KE1F/wn6
 piQY0FfmjwEHk3D9Z1gkdR4=
X-Google-Smtp-Source: ABdhPJx3niu1eWdFCijc4XeXW5ERpS0VFjddRYJZU8IqE4xiyvqKJatzCvGlkGOew4J3H+ZvEKGw9A==
X-Received: by 2002:a17:902:da86:b029:ef:70fa:7b39 with SMTP id
 j6-20020a170902da86b02900ef70fa7b39mr9780905plx.81.1621570599116; 
 Thu, 20 May 2021 21:16:39 -0700 (PDT)
Received: from raspberrypi ([125.141.84.155])
 by smtp.gmail.com with ESMTPSA id y64sm3103960pfy.204.2021.05.20.21.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 21:16:38 -0700 (PDT)
Date: Fri, 21 May 2021 05:16:33 +0100
From: Austin Kim <austindh.kim@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 angelogioacchino.delregno@somainline.org, dmitry.baryshkov@linaro.org
Message-ID: <20210521041633.GA1747@raspberrypi>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 21 May 2021 14:18:46 +0000
Subject: [Freedreno] [PATCH] drm/msm/dpu: remove unused variable cmd_enc
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
Cc: autindh.kim@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-team@lge.com, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWZ0ZXIgdGhlIGNhbGwgdG8gdG9fZHB1X2VuY29kZXJfcGh5c19jbWQoKSBpcyBtYWRlLAonY21k
X2VuYycgaXMgbm90IHVzZWQuIFdoZXJlIHRvX2RwdV9lbmNvZGVyX3BoeXNfY21kKCkgaXMgc2lt
cGx5IHJlcGxhY2VkIHdpdGgKY29udGFpbmVyX29mKHgsIHN0cnVjdCBkcHVfZW5jb2Rlcl9waHlz
X2NtZCwgYmFzZSkgYnkgY29tcGlsZXIuCgpTbyBpdCBoYWQgYmV0dGVyIHJlbW92ZSBXPTEga2Vy
bmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9lbmNvZGVyX3BoeXNfY21kLmM6IEluIGZ1bmN0aW9uCiDigJhkcHVfZW5jb2Rlcl9waHlzX2Nt
ZF93YWl0X2Zvcl9jb21taXRfZG9uZeKAmToKICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlcl9waHlzX2NtZC5jOjY4ODozMTogd2FybmluZzoKICB2YXJpYWJsZSDigJhj
bWRfZW5j4oCZIHNldCBidXQgbm90IHVzZWQKClNpZ25lZC1vZmYtYnk6IEF1c3RpbiBLaW0gPGF1
c3RpbmRoLmtpbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2VuY29kZXJfcGh5c19jbWQuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Vu
Y29kZXJfcGh5c19jbWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNv
ZGVyX3BoeXNfY21kLmMKaW5kZXggYjJiZTM5YjkxNDRlLi4wODg5MDA4NDFiZjggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfY21kLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29kZXJfcGh5c19jbWQu
YwpAQCAtNjg1LDEwICs2ODUsNiBAQCBzdGF0aWMgaW50IGRwdV9lbmNvZGVyX3BoeXNfY21kX3dh
aXRfZm9yX3R4X2NvbXBsZXRlKAogc3RhdGljIGludCBkcHVfZW5jb2Rlcl9waHlzX2NtZF93YWl0
X2Zvcl9jb21taXRfZG9uZSgKIAkJc3RydWN0IGRwdV9lbmNvZGVyX3BoeXMgKnBoeXNfZW5jKQog
ewotCXN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzX2NtZCAqY21kX2VuYzsKLQotCWNtZF9lbmMgPSB0
b19kcHVfZW5jb2Rlcl9waHlzX2NtZChwaHlzX2VuYyk7Ci0KIAkvKiBvbmx5IHJlcXVpcmVkIGZv
ciBtYXN0ZXIgY29udHJvbGxlciAqLwogCWlmICghZHB1X2VuY29kZXJfcGh5c19jbWRfaXNfbWFz
dGVyKHBoeXNfZW5jKSkKIAkJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
