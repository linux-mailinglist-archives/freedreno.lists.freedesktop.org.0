Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C434943C
	for <lists+freedreno@lfdr.de>; Thu, 25 Mar 2021 15:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0A46ED91;
	Thu, 25 Mar 2021 14:37:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7A6ED91
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 14:37:03 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id r193so2121707ior.9
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G3cOV8DtVL9po2vtJRX7EdJuczfbIOHklG7/OvU7p9I=;
 b=lf1dMrmMF5QvhZ1+B7SmvRDk7M8p1OD8InFdZqiFJNjSdBajqnrICrLJtsoRnsn8wy
 Rkdcl6L0XvIHo580Q9zUvZu6EnKKy+Dfhka4ZNUDwoxLo0MWvw36tiGCFkLZyOZuAU6k
 gj8aG0KJkkmWnrwekqkTaHAQEqIUgkgaVRXqo5gJQGn6Vm2lHnmDMkHdI5k2c+vlLMiF
 dps7xn+vmbb5f2/qOGZx3tPmmTuBoipgjmEUdws5MnIQ+5t7qpIJxlBjRlJG79lZMDlD
 nSQPUYTanpxjvhN9AUT6iHLVTk08z+qVk7M21WQvxQcLMja3kS25PQCU2gEBPWvjkRb7
 B5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G3cOV8DtVL9po2vtJRX7EdJuczfbIOHklG7/OvU7p9I=;
 b=pK7fNelPKJyM3Eq2qnVEDL6Vw9+59Ar2GfsCAJ7GYjtQh5SA2jREMz+iw3pawqKCSe
 NBVuoxjHRxf0kcddxKejgQgga7eG4BrkKANJzD/QkYd5FrwZdH/Wqhxf2AoTlGP7cceM
 H9dbj0rphcbYW2IP8y0Pa8110iVOXfhUZMk1sLUUr5H4WYMVv3KSNjmKNZZjM+vhoixA
 VNoU2o2ClSYH17xfYG2o78j3660V5w4M9Oct/Gc7ohGelZGd+AHaWG387CsQXHB9BmU0
 373sLayaNbU/V0h+BknT7+24/uhUfwnHgp9qwKb9Yq30a1gHkAPH8hJGM2rds2xzef2J
 46dA==
X-Gm-Message-State: AOAM531yleS7o3BMZpC8PxOZgUC6ZbnV+Ico9zEtgfFjYeLvsqPpJRh2
 BDoHTZqujwznCGeYMl2XgrTORA==
X-Google-Smtp-Source: ABdhPJyN8CG8Dj/tyOUZgYG6FC1ZRwDa9neTBVcT/5MlZ8wzGsR93KrVS08fPYwlV/8lr9GyMLGmEQ==
X-Received: by 2002:a02:ce8d:: with SMTP id y13mr7737038jaq.29.1616683022413; 
 Thu, 25 Mar 2021 07:37:02 -0700 (PDT)
Received: from jordan-laptop.lan (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id g8sm2501023ile.44.2021.03.25.07.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 07:37:01 -0700 (PDT)
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: linux-kernel@vger.kernel.org
Date: Thu, 25 Mar 2021 08:37:00 -0600
Message-Id: <20210325143700.1490518-1-jordan@cosmicpenguin.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] mailmap: Update email address for Jordan Crouse
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Lobakin <alobakin@pm.me>, Miguel Ojeda <ojeda@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

jcrouse at codeaurora.org ha started bouncing. Redirect to a
more permanent address.

Signed-off-by: Jordan Crouse <jordan@cosmicpenguin.net>
---

 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 85b93cdefc87..8c489cb1d1ce 100644
--- a/.mailmap
+++ b/.mailmap
@@ -165,6 +165,7 @@ Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
 Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
 John Stultz <johnstul@us.ibm.com>
+Jordan Crouse <jordan@cosmicpenguin.net> <jcrouse@codeaurora.org>
 <josh@joshtriplett.org> <josh@freedesktop.org>
 <josh@joshtriplett.org> <josh@kernel.org>
 <josh@joshtriplett.org> <josht@linux.vnet.ibm.com>
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
