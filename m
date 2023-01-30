Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43072681B76
	for <lists+freedreno@lfdr.de>; Mon, 30 Jan 2023 21:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118F610E12D;
	Mon, 30 Jan 2023 20:27:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A90210E13F
 for <freedreno@lists.freedesktop.org>; Mon, 30 Jan 2023 20:27:55 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C07CE1F526;
 Mon, 30 Jan 2023 21:27:52 +0100 (CET)
Date: Mon, 30 Jan 2023 21:27:51 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <20230130202751.jnodgfo252pmlusq@SoMainline.org>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-10-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674498274-6010-10-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH v1 09/14] drm/msm/dsi: export struct
 msm_compression_info to dpu encoder
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, airlied@gmail.com, andersson@kernel.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-01-23 10:24:29, Kuogee Hsieh wrote:
<snip>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d612419..70a74ed 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
<snip>
> @@ -892,6 +894,10 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>  
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>  
> +	for (i = 0; i < cat->dsc_count; i++)
> +		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> +				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
> +

Note that we've landed snapshotting of the DSC block in [1] because we
need it now, and - as discussed elsewhere - is perfect material to be
submitted in a standalone, appropriately described/titled patch (fine to
be part of a series, as long as that patch comprises this single diff).

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a7efe60e36b9c0e966d7f82ac90a89b591d984e9

Keep in mind that it was added at the bottom of dpu_kms_mdp_snapshot()
instead of the top, so git might not clean it up or mark it as conflict
during a rebase; don't forget to drop it from v2 :)

>  	/* dump CTL sub-blocks HW regs info */
>  	for (i = 0; i < cat->ctl_count; i++)
>  		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,

<snip>

- Marijn
