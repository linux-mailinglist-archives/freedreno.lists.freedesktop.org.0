Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FADE809F87
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 10:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C49B10EA32;
	Fri,  8 Dec 2023 09:36:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8375910EA32;
 Fri,  8 Dec 2023 09:36:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4C97FCE25E2;
 Fri,  8 Dec 2023 09:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36410C433C8;
 Fri,  8 Dec 2023 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702028178;
 bh=qVk3EK9ezayq67rrdxqh4L6o43FNM8c/o+5+uydbZRA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HKu9juMonwj7b7GSuf8G9ZYE9dk8etP77XppZIZD2ouJ1FUpYPItkFCj6g0xgH0Eu
 ncic9XhtKib++MYvS7EMJrJ3ldGx7Rzr2gw6F+p3ppFhB1mP3th1fOqgPvXylAVyRf
 mxSQNydy9+yivsYR8M2t0lm5AyzCAmwj5q92sA8qbOBPOYaLi24Ss9KFm9ihu6siB9
 Ue+Un+M9SIfpIEvwTIMyMLYvdyiTtc5AV6Nt8gAlWvImU141j/dQvork7wSEzS7onh
 rSGyiM+vvSZj5hW6UlMgFQa+RRCxTOZ05gclzeM9esZhlwmEYnOq15by7YkWnhE5ah
 aQpguOzNzG6/Q==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231208010314.3395904-3-dmitry.baryshkov@linaro.org>
References: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
 <20231208010314.3395904-3-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 2/2] drm/vkms: move wb's atomic_check from
 encoder to connector
Message-Id: <170202817600.16687.2759695284451407147.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:36:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 08 Dec 2023 04:03:14 +0300, Dmitry Baryshkov wrote:
> As the renamed drm_atomic_helper_check_wb_connector_state() now accepts
> drm_writeback_connector as the first argument (instead of drm_encoder),
> move the VKMS writeback atomic_check from drm_encoder_helper_funcs to
> drm_connector_helper_funcs. Also drop the vkms_wb_encoder_helper_funcs,
> which have become empty now.
> 
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

