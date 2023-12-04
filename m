Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F65803637
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 15:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BCA10E266;
	Mon,  4 Dec 2023 14:17:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D03510E266
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 14:16:40 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ca04b1cc37so7914881fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 06:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701699398; x=1702304198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZaBZHQpZqDG2XfMQ4dp5yLxoXxp+aROTaKcGQwWYDB8=;
 b=jS4gI69AfeqfgHVfkOWRm1i9tN4A7D75ycom2qktiLc8ljXd2K7Ww7VrPqvtVJWhDG
 2cRa4uZo89s2vtb0VMOiOj4I03Ra1n/zqIG7VFe5VFpvzb63SoRTjxqM1fLUw22ZQ4Yb
 5MAc5d2BvTn7sLxkdnkTkqMRia10sB2xfXhzIqUwhdCUKtc/+c8AZsMnG8UZsgmHSSMj
 S0taay2xPyqvj99tfrNDtaTboSMYekDie6FrJxslPOs1hjnf2O64l/CupfXAgLnx0Zct
 dCEbNDfazsXrMbYfiDg4w9mnnRCURp+YMnAw/I1zNJ3vk4Ak+1Rbk1AhHflsus53DQBe
 nZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701699398; x=1702304198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZaBZHQpZqDG2XfMQ4dp5yLxoXxp+aROTaKcGQwWYDB8=;
 b=BbA/22eYQrpSjqEvOx9lXHTt3Pe0vdUmj84ZP7T5walzZWcfE5WrnThWMnHpQk7bn7
 x+2j6cZWq7GC7FzALeVKt4gCCXvsW7z77NQLdxUsQ42kiYQ73qJCqU0ZkEERnwSgY9Ka
 zS22cGI7vUUe+koIRDJP1YcB1T/BOBouM9mtxHDJJktIRIYJdLgnWHfT1ZR7b/30Uv/R
 mIjrZ/TqOtpVggSVfiGG6WeU1AOLuEn65vUFvFfXlHxDXtwnqlJHHvA8UbNKlzz4Z7nM
 r+Bm8w9ssiwcMWtmmACnzdgEhEc4JOQnbvwC5svZC70i0FO3UVmERuoSTGZmPX+KfKzG
 GJAA==
X-Gm-Message-State: AOJu0YwZyzspfVdWzzDY3YgM97Bm7cCfa+b/aSmR9JYRX0etgFfubitB
 38h1YzrxiHk7ZB1I2+iIpxp97A==
X-Google-Smtp-Source: AGHT+IFhbnCuBV0JCw7uGD7qCiHyX7TJPwxSzrjLdzNKuV7GNJId7BTvK6QFl+pUyF8nsnegDyQuUQ==
X-Received: by 2002:a2e:7a14:0:b0:2ca:135:2204 with SMTP id
 v20-20020a2e7a14000000b002ca01352204mr1307465ljc.16.1701699398333; 
 Mon, 04 Dec 2023 06:16:38 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:16:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon,  4 Dec 2023 16:16:33 +0200
Message-ID: <170169936702.76859.2850036545937110756.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919174813.26958-1-quic_abhinavk@quicinc.com>
References: <20230919174813.26958-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm: remove drm_bridge_hpd_disable() from
 drm_bridge_connector_destroy()
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
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org,
 jani.nikula@linux.intel.com, quic_parellan@quicinc.com,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 19 Sep 2023 10:48:12 -0700, Abhinav Kumar wrote:
> drm_bridge_hpd_enable()/drm_bridge_hpd_disable() callbacks call into
> the respective driver's hpd_enable()/hpd_disable() ops. These ops control
> the HPD enable/disable logic which in some cases like MSM can be a
> dedicate hardware block to control the HPD.
> 
> During probe_defer cases, a connector can be initialized and then later
> destroyed till the probe is retried. During connector destroy in these
> cases, the hpd_disable() callback gets called without a corresponding
> hpd_enable() leading to an unbalanced state potentially causing even
> a crash.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm: remove drm_bridge_hpd_disable() from drm_bridge_connector_destroy()
      commit: f730e7adfd69d7ac859d8fe4d67e980cbad1e445

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
