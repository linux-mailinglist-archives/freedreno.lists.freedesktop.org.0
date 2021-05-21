Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC038C6DB
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 14:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8176E4E8;
	Fri, 21 May 2021 12:50:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBB16E4DE;
 Fri, 21 May 2021 12:49:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE40E6128A;
 Fri, 21 May 2021 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621601399;
 bh=G6ouIauR05ZjrZdPDoLSgmtuQODfUpudDe0dhIJwxGg=;
 h=From:To:Cc:Subject:Date:From;
 b=RXyaAIs4G0Wi1Rot89jVxURym/6ZQSoS/jdA8GQctBWZDIgCvsVVQWExpQBN9oF+K
 HMEy6DtuwtA6mmNjtELemlALcpBAOWrRfq0gKd47AjhhQKIsWMoN/FdlBHSBno+/xr
 TP8FSI0GuhTUqrUYr0x6VMucqe0fv1oI9+6/NhuDPGdnxds2iSVdZuEU11Pubs3wou
 B1fv4Y2XlkPjG9D5BQvEPUxQZH5x8p+vXQb6P8HR+IbcJQiD/tMogtphEyCoIeb9ED
 LyqRj+2W2RVnyqc06wU879N3lQAw5wOoMnk8E/o+Ucla6GsnhUJQ0PVqfM4M3dwkpW
 ZsgAu2R9CDXkQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Date: Fri, 21 May 2021 18:19:29 +0530
Message-Id: <20210521124946.3617862-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Subject: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Display Stream Compression (DSC) compresses the display stream in host which
is later decoded by panel. This series enables this for Qualcomm msm driver.
This was tested on Google Pixel3 phone which use LGE SW43408 panel.

The changes include adding DT properties for DSC then hardware blocks support
required in DPU1 driver and support in encoder. We also add support in DSI
and introduce required topology changes.

In order for panel to set the DSC parameters we add dsc in drm_panel and set
it from the msm driver.

Complete changes which enable this for Pixel3 along with panel driver (not
part of this series) and DT changes can be found at:
git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_rfc

Comments welcome!

Vinod Koul (13):
  drm/dsc: Add dsc pps header init function
  dt-bindings: msm/dsi: Document Display Stream Compression (DSC)
    parameters
  drm/msm/dsi: add support for dsc data
  drm/msm/disp/dpu1: Add support for DSC
  drm/msm/disp/dpu1: Add support for DSC in pingpong block
  drm/msm/disp/dpu1: Add DSC support in RM
  drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
  drm/msm/disp/dpu1: Add DSC support in hw_ctl
  drm/msm/disp/dpu1: Don't use DSC with mode_3d
  drm/msm/disp/dpu1: Add support for DSC in encoder
  drm/msm/disp/dpu1: Add support for DSC in topology
  drm/msm/dsi: Add support for DSC configuration
  drm/msm/dsi: Pass DSC params to drm_panel

 .../devicetree/bindings/display/msm/dsi.txt   |  15 +
 drivers/gpu/drm/drm_dsc.c                     |  11 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 204 +++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  11 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   2 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  22 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  26 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 221 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  79 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  32 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  32 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   1 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  10 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 293 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h                 |  32 ++
 include/drm/drm_dsc.h                         |  16 +
 include/drm/drm_panel.h                       |   7 +
 23 files changed, 1043 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h

-- 
2.26.3

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
