Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CC084D06B
	for <lists+freedreno@lfdr.de>; Wed,  7 Feb 2024 19:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4CB10E649;
	Wed,  7 Feb 2024 18:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IcfyBb75";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FA910E649
 for <freedreno@lists.freedesktop.org>; Wed,  7 Feb 2024 18:01:23 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 417GOT79027529
 for <freedreno@lists.freedesktop.org>; Wed, 7 Feb 2024 18:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=FpiTJbWQ5G8XKdB/PlCSrB9YMjCPfUNcsqKBfDW3XBQ=; b=Ic
 fyBb75FFaxOBT9ylItLC4LKCHqoPqC3iwe81d5+bxxdrB1kFL+9ZupPtcFyocUfi
 GFqQRcwUNJ247YvqyGSyPfj4FWIfeO1VAgf6MT/RERZPQ4rDWSThHF/7uqFwgnME
 Bf4kiL61qYpkQEdq7Ko1LG4K/yB7Ju1HQrH0mRYbUlrT6df7aFKzozY2GXUE1vJU
 pfB8jZOQLm2BpP6ACmnHiMCtWV+EpfDoc5risbz9RkWJ32iYW0oudL8Vd6iW3IJ9
 h86hrQsDKlzEneeULOLJqVg5PFjpYtT02eu1O0mPjKqxlr3JoInHkH6Fuw8KDoR6
 qFfkfxCjaAakQk22z8yA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w44fwhdnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Feb 2024 18:01:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 417I1Kl0009721
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 7 Feb 2024 18:01:20 GMT
Received: from [10.110.9.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 10:01:20 -0800
Message-ID: <6bae5747-0eb4-5fa9-d207-b26a1ec8952f@quicinc.com>
Date: Wed, 7 Feb 2024 10:01:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dsi: Document DSC related
 pclk_rate and hdisplay calculations
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>
References: <20231202235947.1284568-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202235947.1284568-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -C0jrzccUNGexYneefgqZQNohFx_gVzS
X-Proofpoint-ORIG-GUID: -C0jrzccUNGexYneefgqZQNohFx_gVzS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402070133
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12/2/2023 3:59 PM, Dmitry Baryshkov wrote:
> Provide actual documentation for the pclk and hdisplay calculations in
> the case of DSC compression being used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v2:
> - Followed suggestion by Abhinav and Marijn to improve documentatry
>    comments.
> 
> Changes since v1:
> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
> - Added a pointer from dsi_timing_setup() docs to
>    dsi_adjust_pclk_for_compression() (Marijn)
> - Fixed two typo (Marijn)
> 
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 33 ++++++++++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index deeecdfd6c4e..d60ad796527c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -529,6 +529,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>   	clk_disable_unprepare(msm_host->byte_clk);
>   }
>   
> +/**
> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
> + * @mode: The selected mode for the DSI output
> + * @dsc: DRM DSC configuration for this DSI output
> + *
> + * Adjust the pclk rate by calculating a new hdisplay proportional to
> + * the compression ratio such that:
> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
> + *
> + * Porches do not need to be adjusted:
> + * - For VIDEO mode they are not compressed by DSC and are passed as is.
> + * - For CMD mode there are no actual porches. Instead these fields
> + *   currently represent the overhead to the image data transfer. As such, they
> + *   are calculated for the final mode parameters (after the compression) and
> + *   are not to be adjusted too.
> + *
> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
> + *  refresh rate and data overhead as a starting point of the calculations.
> + */

I think instead of saying refresh rate, we should say "transfer time".

refresh rate could be confused with drm_mode_vrefresh(). But technically 
we could still have the same refresh rate but finish the transfer faster 
by bumping the pixel clock of DSI but can still be limited by the 
panel's refresh rate.

But rest LGTM.

>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>   		const struct drm_dsc_config *dsc)
>   {
> @@ -951,8 +970,18 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		if (ret)
>   			return;
>   
> -		/* Divide the display by 3 but keep back/font porch and
> -		 * pulse width same
> +		/*
> +		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
> +		 * enabled, bus width is extended to 6 bytes.
> +		 *
> +		 * Calculate the number of pclks needed to transmit one line of
> +		 * the compressed data.
> +
> +		 * The back/font porch and pulse width are kept intact. For
> +		 * VIDEO mode they represent timing parameters rather than
> +		 * actual data transfer, see the documentation for
> +		 * dsi_adjust_pclk_for_compression(). For CMD mode they are
> +		 * unused anyway.
>   		 */
>   		h_total -= hdisplay;
>   		if (wide_bus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
