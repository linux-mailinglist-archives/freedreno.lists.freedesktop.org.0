Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E55F1EDE
	for <lists+freedreno@lfdr.de>; Sat,  1 Oct 2022 21:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AF510E3BB;
	Sat,  1 Oct 2022 19:08:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 11241 seconds by postgrey-1.36 at gabe;
 Sat, 01 Oct 2022 19:08:20 UTC
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F7710E08D
 for <freedreno@lists.freedesktop.org>; Sat,  1 Oct 2022 19:08:20 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CB1A020363;
 Sat,  1 Oct 2022 21:08:17 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Date: Sat,  1 Oct 2022 21:08:02 +0200
Message-Id: <20221001190807.358691-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/5] drm: Fix math issues in MSM DSC
 implementation
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
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Various removals of complex yet unnecessary math, fixing all uses of
drm_dsc_config::bits_per_pixel to deal with the fact that this field
includes four fractional bits, and finally an approach for dealing with
dsi_host setting negative values in range_bpg_offset, resulting in
overflow inside drm_dsc_pps_payload_pack().

Note that updating the static bpg_offset array to limit the size of
these negative values to 6 bits changes what would be written to the DPU
hardware at register(s) DSC_RANGE_BPG_OFFSET, hence the choice has been
made to cover up for this while packing the value into a smaller field
instead.

Altogether this series is responsible for solving _all_ Display Stream
Compression issues and artifacts on the Sony Tama (sdm845) Akatsuki
smartphone (2880x1440p).

Marijn Suijten (5):
  drm/msm/dsi: Remove useless math in DSC calculation
  drm/msm/dsi: Remove repeated calculation of slice_per_intf
  drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bits
  drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional
    bits
  drm/dsc: Prevent negative BPG offsets from shadowing adjacent
    bitfields

 drivers/gpu/drm/display/drm_dsc_helper.c   |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 11 +-----
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 45 ++++++++++++++--------
 3 files changed, 33 insertions(+), 29 deletions(-)

--
2.37.3

