Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 546497D837C
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 15:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD21410E7D8;
	Thu, 26 Oct 2023 13:26:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3DB10E7D5;
 Thu, 26 Oct 2023 13:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCD386347E;
 Thu, 26 Oct 2023 13:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5DFC433C7;
 Thu, 26 Oct 2023 13:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698326783;
 bh=iRn7vDIBkvqTVmnZQoeJoZ6KdPtszrHGt6CVY4MQMDc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=R31R0WO0LMF1N+jXnuaW7wPNJHkEYjQI51xow57y4Ms4dtrziSUH8mU/kUU7YRWbe
 BGPE8mcSwd1EfqPZITWQeq+2gSrI3TlKK6qEmJPHCqVe2+nkLWDS9AMLNbLj98Onha
 4djo4sNWqKU9QU/jM11WEst61l3ivN/ampO2jswTyQ/R75dqeZDycP3UF8Bhke6ql9
 JM4VX6l3qDGnS7J9U9pz5rmIRIy0NukMe0N2haIX5bcpYyEJI1x07mca7GAEdoXx3p
 eEKlU94CfYbzvD8W8xV93gwnef2QPLS6jy+4GyU++sskRmHFh2FxY62WJC+CLgMTAj
 h1xj3U3JhJywg==
From: Maxime Ripard <mripard@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
References: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
Message-Id: <169832677721.958223.13412416633186382267.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 15:26:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Subject: Re: [Freedreno] [PATCH 1/2] drm/ci: pick up -external-fixes from
 the merge target repo
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

On Sun, 08 Oct 2023 16:23:19 +0300, Dmitry Baryshkov wrote:
> In case of the merge requests it might be useful to push repo-specific
> fixes which have not yet propagated to the -external-fixes branch in the
> main UPSTREAM_REPO. For example, in case of drm/msm development, we are
> staging fixes locally for testing, before pushing them to the drm/drm
> repo. Thus, if the CI run was triggered by merge request, also pick up
> the -external fixes basing on the the CI_MERGE target repo / and branch.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

