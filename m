Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17E355E42
	for <lists+freedreno@lfdr.de>; Tue,  6 Apr 2021 23:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759F36E8CE;
	Tue,  6 Apr 2021 21:54:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 412 seconds by postgrey-1.36 at gabe;
 Tue, 06 Apr 2021 21:54:36 UTC
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6816E8CE
 for <freedreno@lists.freedesktop.org>; Tue,  6 Apr 2021 21:54:36 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5DEF43F347;
 Tue,  6 Apr 2021 23:47:38 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Date: Tue,  6 Apr 2021 23:47:23 +0200
Message-Id: <20210406214726.131534-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/3] drm/msm/mdp5: Emit vsync signal often enough
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This set of patches corrects and improves VSync-related register setup
on the MDP5 block.  Values written to the registers were way too high
leading to the MDSS block counting way too many ticks on the vclk before
emitting a vsync interrupt, resulting in significant update issues on
command- and video-mode panels.  With lower values - that match those of
downstream kernels - the panels on Sony devices (Xperia X, XA2 Ultra,
and more) update at an acceptable rate without "pp_done" timeouts.

The Driver-IC in these panels is also able to drive an interrupt line
and a future patchset will enable the use of this "disp-te" GPIO beyond
acquiring it in dsi_host.  This fixes panel framerate the correct way
(instead of running at half the desired framerate), but these patches
are still needed to aid development now and shorten lockup times when
the TE interrupt misbehaves by not arriving at all.

AngeloGioacchino Del Regno (1):
  drm/msm/mdp5: Disable pingpong autorefresh at tearcheck init

Marijn Suijten (2):
  drm/msm/mdp5: Configure PP_SYNC_HEIGHT to double the vtotal
  drm/msm/mdp5: Do not multiply vclk line count by 100

 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.31.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
