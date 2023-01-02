Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C80765B414
	for <lists+freedreno@lfdr.de>; Mon,  2 Jan 2023 16:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0DB10E350;
	Mon,  2 Jan 2023 15:21:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FA010E34F
 for <freedreno@lists.freedesktop.org>; Mon,  2 Jan 2023 15:21:47 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1pCMdF-0005jz-F4; Mon, 02 Jan 2023 16:21:45 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1pCMdB-0007uo-Tn; Mon, 02 Jan 2023 16:21:41 +0100
Date: Mon, 2 Jan 2023 16:21:41 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Message-ID: <20230102152141.GA30338@pengutronix.de>
References: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
 <20230102161757.v5.4.I96e0bf9eaf96dd866111c1eec8a4c9b70fd7cbcb@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102161757.v5.4.I96e0bf9eaf96dd866111c1eec8a4c9b70fd7cbcb@changeid>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v5 4/5] drm/msm/a6xx: Remove cx gdsc polling
 using 'reset'
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
Cc: Sean Paul <sean@poorly.run>, Ulf Hansson <ulf.hansson@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, freedreno <freedreno@lists.freedesktop.org>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jan 02, 2023 at 04:18:30PM +0530, Akhil P Oommen wrote:
> Remove the unused 'reset' interface which was supposed to help to ensure
> that cx gdsc has collapsed during gpu recovery. This is was not enabled
> so far due to missing gpucc driver support. Similar functionality using
> genpd framework will be implemented in the upcoming patch.
> 
> This effectively reverts commit 1f6cca404918
> ("drm/msm/a6xx: Ensure CX collapse during gpu recovery").
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
