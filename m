Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EDD4B0BD4
	for <lists+freedreno@lfdr.de>; Thu, 10 Feb 2022 12:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7810E802;
	Thu, 10 Feb 2022 11:08:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDF210E802
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 11:08:03 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f23so9702516lfe.5
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 03:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GAVqfn2OlJnaPhVaal0OTt8GkRWxgqq3BRYHfex43bQ=;
 b=eXRA+OMJ4xvu7XUkXE8A1QNPl6XeV2NViBIP24pfmczewmuGnEo22jQCumMnAhCFMz
 vSj0uJWslGQJgDDa25PU4NUMQoYo77VFRA6a7Y9uLUZj8TfopLlJ+4GxZc+FSufre5eH
 ukXKJ84MWC71Fat48EQt6NoDFvj6XDaoeUNVO4wGcvzELwOzHmikBfKORu8Mt0uOMVv9
 gN64bucozrTavo/MN+fa0zILcFoOoUGcxlrVPtvvTmyZiGOwnYkRznwRlRl3odyVXtlg
 IJCYNJK7iff8TpRebVyZ5trAbvNAAyzmhEfFNyG/fDrNrpMHbs2z2rZ8KeogAqMiw8h7
 N2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GAVqfn2OlJnaPhVaal0OTt8GkRWxgqq3BRYHfex43bQ=;
 b=iOgf01t5+CsUXrucG8aJk34+xpHnUViRgZL5Br1derOoHKAQnblU7coyYxtJaZ2xSs
 pzsKzpenW9BP/S5Vm1xoQRGjPATxjAdSH+ZjBrw+j3D9UX3Fygum2rvj89vA/CTfSEhM
 13XDTyQsHsqhP0CygKS4p8DSmDhRtgoS5wXL2yYqBFzvt6JAWWPlcCO28m7ikE6aNGrH
 9QSiIZK74qmyFZVoUfj6AMJt3lLAM8TY9xjx/LmFGFulfkqgqrMzgEWlBOR2P+3cnQ8z
 uDTgb/HvZ6RFBVYUCQhazeZXfJe02tTwhmiSVKlj0Xvj/JZfs4QVqflHGLBIyN15Tg3/
 9dmg==
X-Gm-Message-State: AOAM533+kERIZaYjn3/fCxFHsnCVYP6sUPFiHz64NraMn0glQiLXJHws
 ep+5Udvgi3gQZxmJfWYPRSiUcA==
X-Google-Smtp-Source: ABdhPJwkht9x8dOfGAEnVyxU7zJa0q2yxslNzRuT1ZVH5FsX+Ybq14ysKU2hHQRz7ir8teHdklJLBA==
X-Received: by 2002:a05:6512:1315:: with SMTP id
 x21mr5008968lfu.454.1644491281066; 
 Thu, 10 Feb 2022 03:08:01 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z8sm2836057ljz.90.2022.02.10.03.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:08:00 -0800 (PST)
Message-ID: <93ee82de-6ea3-e58b-8691-9fc8d0dad439@linaro.org>
Date: Thu, 10 Feb 2022 14:07:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-2-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210103423.271016-2-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [REPOST PATCH v4 01/13] drm/msm/dsi: add support
 for dsc data
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2022 13:34, Vinod Koul wrote:
> Display Stream Compression (DSC) parameters need to be calculated. Add
> helpers and struct msm_display_dsc_config in msm_drv for this
> msm_display_dsc_config uses drm_dsc_config for DSC parameters.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 132 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h      |  15 ++++
>   2 files changed, 147 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 6b3ced4aaaf5..27553194f9fa 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -31,6 +31,8 @@
>   
>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>   
> +static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc);
> +
>   static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
>   {
>   	u32 ver;
> @@ -157,6 +159,7 @@ struct msm_dsi_host {
>   	struct regmap *sfpb;
>   
>   	struct drm_display_mode *mode;
> +	struct msm_display_dsc_config *dsc;
>   
>   	/* connected device info */
>   	struct device_node *device_node;
> @@ -1718,6 +1721,135 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
>   	return -EINVAL;
>   }
>   
> +static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
> +	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
> +	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
> +};
> +
> +/* only 8bpc, 8bpp added */
> +static char min_qp[DSC_NUM_BUF_RANGES] = {
> +	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
> +};
> +
> +static char max_qp[DSC_NUM_BUF_RANGES] = {
> +	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
> +};
> +
> +static char bpg_offset[DSC_NUM_BUF_RANGES] = {
> +	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
> +};
> +
> +static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc)
> +{
> +	int mux_words_size;
> +	int groups_per_line, groups_total;
> +	int min_rate_buffer_size;
> +	int hrd_delay;
> +	int pre_num_extra_mux_bits, num_extra_mux_bits;
> +	int slice_bits;
> +	int target_bpp_x16;
> +	int data;
> +	int final_value, final_scale;
> +	int i;
> +
> +	dsc->drm->rc_model_size = 8192;
> +	dsc->drm->first_line_bpg_offset = 12;
> +	dsc->drm->rc_edge_factor = 6;
> +	dsc->drm->rc_tgt_offset_high = 3;
> +	dsc->drm->rc_tgt_offset_low = 3;
> +	dsc->drm->simple_422 = 0;
> +	dsc->drm->convert_rgb = 1;
> +	dsc->drm->vbr_enable = 0;
> +
> +	/* handle only bpp = bpc = 8 */
> +	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
> +		dsc->drm->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
> +
> +	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
> +		dsc->drm->rc_range_params[i].range_min_qp = min_qp[i];
> +		dsc->drm->rc_range_params[i].range_max_qp = max_qp[i];
> +		dsc->drm->rc_range_params[i].range_bpg_offset = bpg_offset[i];
> +	}
> +
> +	dsc->drm->initial_offset = 6144; /* Not bpp 12 */
> +	if (dsc->drm->bits_per_pixel != 8)
> +		dsc->drm->initial_offset = 2048;	/* bpp = 12 */
> +
> +	mux_words_size = 48;		/* bpc == 8/10 */
> +	if (dsc->drm->bits_per_component == 12)
> +		mux_words_size = 64;
> +
> +	dsc->drm->initial_xmit_delay = 512;
> +	dsc->drm->initial_scale_value = 32;
> +	dsc->drm->first_line_bpg_offset = 12;
> +	dsc->drm->line_buf_depth = dsc->drm->bits_per_component + 1;
> +
> +	/* bpc 8 */
> +	dsc->drm->flatness_min_qp = 3;
> +	dsc->drm->flatness_max_qp = 12;
> +	dsc->det_thresh_flatness = 7 + 2 * (dsc->drm->bits_per_component - 8);
> +	dsc->drm->rc_quant_incr_limit0 = 11;
> +	dsc->drm->rc_quant_incr_limit1 = 11;
> +	dsc->drm->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> +
> +	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
> +	 * params are calculated
> +	 */
> +	dsc->slice_last_group_size = 3 - (dsc->drm->slice_width % 3);
> +	groups_per_line = DIV_ROUND_UP(dsc->drm->slice_width, 3);
> +	dsc->drm->slice_chunk_size = dsc->drm->slice_width * dsc->drm->bits_per_pixel / 8;
> +	if ((dsc->drm->slice_width * dsc->drm->bits_per_pixel) % 8)
> +		dsc->drm->slice_chunk_size++;
> +
> +	/* rbs-min */
> +	min_rate_buffer_size =  dsc->drm->rc_model_size - dsc->drm->initial_offset +
> +				dsc->drm->initial_xmit_delay * dsc->drm->bits_per_pixel +
> +				groups_per_line * dsc->drm->first_line_bpg_offset;
> +
> +	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->drm->bits_per_pixel);
> +
> +	dsc->drm->initial_dec_delay = hrd_delay - dsc->drm->initial_xmit_delay;
> +
> +	dsc->drm->initial_scale_value = 8 * dsc->drm->rc_model_size /
> +				       (dsc->drm->rc_model_size - dsc->drm->initial_offset);
> +
> +	slice_bits = 8 * dsc->drm->slice_chunk_size * dsc->drm->slice_height;
> +
> +	groups_total = groups_per_line * dsc->drm->slice_height;
> +
> +	data = dsc->drm->first_line_bpg_offset * 2048;
> +
> +	dsc->drm->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->drm->slice_height - 1));
> +
> +	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 * dsc->drm->bits_per_component + 4) - 2);
> +
> +	num_extra_mux_bits = pre_num_extra_mux_bits - (mux_words_size -
> +			     ((slice_bits - pre_num_extra_mux_bits) % mux_words_size));
> +
> +	data = 2048 * (dsc->drm->rc_model_size - dsc->drm->initial_offset + num_extra_mux_bits);
> +	dsc->drm->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
> +
> +	/* bpp * 16 + 0.5 */
> +	data = dsc->drm->bits_per_pixel * 16;
> +	data *= 2;
> +	data++;
> +	data /= 2;
> +	target_bpp_x16 = data;
> +
> +	data = (dsc->drm->initial_xmit_delay * target_bpp_x16) / 16;
> +	final_value =  dsc->drm->rc_model_size - data + num_extra_mux_bits;
> +	dsc->drm->final_offset = final_value;
> +
> +	final_scale = 8 * dsc->drm->rc_model_size / (dsc->drm->rc_model_size - final_value);
> +
> +	data = (final_scale - 9) * (dsc->drm->nfl_bpg_offset + dsc->drm->slice_bpg_offset);
> +	dsc->drm->scale_increment_interval = (2048 * dsc->drm->final_offset) / data;
> +
> +	dsc->drm->scale_decrement_interval = groups_per_line / (dsc->drm->initial_scale_value - 8);
> +
> +	return 0;
> +}
> +
>   static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
>   {
>   	struct device *dev = &msm_host->pdev->dev;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d7574e6bd4e4..384f9bad4760 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -30,6 +30,7 @@
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_fb_helper.h>
> +#include <drm/drm_dsc.h>
>   #include <drm/msm_drm.h>
>   #include <drm/drm_gem.h>
>   
> @@ -134,6 +135,20 @@ struct msm_drm_thread {
>   	struct kthread_worker *worker;
>   };
>   
> +/* DSC config */
> +struct msm_display_dsc_config {
> +	struct drm_dsc_config *drm;
> +
> +	u32 initial_lines;
> +	u32 pkt_per_line;
> +	u32 bytes_in_slice;
> +	u32 bytes_per_pkt;
> +	u32 eol_byte_num;
> +	u32 pclk_per_line;
> +	u32 slice_last_group_size;
> +	u32 det_thresh_flatness;
> +};
> +
>   struct msm_drm_private {
>   
>   	struct drm_device *dev;


-- 
With best wishes
Dmitry
