Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE8CD08148
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 10:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34E610E83F;
	Fri,  9 Jan 2026 09:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxQnQQuo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVhN8FLw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEC910E83F
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 09:06:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6098JoPf3727729
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 09:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=; b=MxQnQQuoXitKlChq
 l6q7BSifxiV8rH5QEvjeFOrhempCtgTZ+u7ooGB/UhvHfgEfbqxdC6yxub6E8Or0
 yVjrRcxF+ffMhmOKd4z+ERj0g0kpPitgJGPsk4mgbqKegMyM1uZaCrGjOsEUhx9k
 KhAfUKLGpS94BXJzfEpLTJErc9b/8oNC+3uGpoysoODh+lj/154yHOSRdmZsfHx2
 iHCPpriFcXjxgVFZR3/vaaYFbcAAJ35tWqMWLuvQR8itwMbWK1O/lxxHrM2EvN1M
 8CwtGZq9JJp9N4yrgFwZsRcEj3zLAZpE1aNmEC2ah5L7RqMez9ND+vsQHRjh7o4B
 LSb6iA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhdbx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 09:06:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b5ff26d6a9so79208085a.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 01:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767949593; x=1768554393;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=;
 b=AVhN8FLwwskuIAHbZJQrhibQ4BnaA/7QYirDoX7rFpVsGdhRa3Ge7m3/G93ApYPAMR
 569JTgUBKlz6MpiCvfJdmpdtZWxIVlk9u93OUwAToZ7zIbDTffZEuSCUt/mYwep1v1un
 I/J2GZ7m9M0JK7hcCM1Ka4UvZsfRog5joDXQpml9LGROHtqqCvzDRxUVu0lXFMYo9Xe1
 FNenjGcv+e6LF3UJzps5lhs10GX/FcmQNRMAvLWHcpKFdbA6WB6a3tmrP1HXsxPA0bnG
 xH+TeS0xeWmNF/Peujt44ya1ZaApHGULNWe5yZ4Sa78wo5S1jgHM79TQQ7D7jqySb0EB
 nMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767949593; x=1768554393;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrGDbD4E64ochKqofLUd4Z6PCmwVO6LP8USJFReLrZY=;
 b=WqoElMNoqtJcgUc6oVA1QlVforUReK5uNLqbA6mp2ICA86dzxJfvFEO/OBjjBfb45f
 bov+rvvtOb9raexADuEh8w/KTSgRdya3WAvwU86ZJszrpjh2h1xk45LGGtMQGP7P0cBL
 1rll/Mgu0mIIg/LKimmiyCJtdjhGQnFIrZMx8RHLDgzyZWwkFGMoQ76CObaJonKQn1K8
 pBiw4incdALN+YJoK7siHNNur02gSG3PG5dFhz4Lmkd+tp+zSJrpVdoIIvOYZjsUix1t
 /dg7lTEJnqwyQJHUdpkCMbfgXiRbOnry3XcJqabmMx4FIuWWY+hoT67FD6/LG2zXZJI/
 d1tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDqw7iiE+Dx60CRg5K2zWle1VxitwyastMzbjvSwrYZVEqQuksJFDfKmonqSjMeFcTdIVUwdEJwU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1BL1cigvWXY56ysstA5WPY0XcOFN+PzWpfjj38K/NrHSCxWpW
 kpI/yBq+ECNTBFRSfrmEdbQRMSJuL1SihaLl7YAubsPZFHjR4mAbkqVEU7WiJIrJ7iSVXLHFsGR
 glGBegVKEgO72DzdZAerLu21HLV4eNx/b2DBG2gGvhlKUrO4PiLcfj7hWRWzWczjlu56Qkcg=
X-Gm-Gg: AY/fxX6grBu8kcrknAQMb2CQgA9VfRyNPBLzhsNzyO2ATcbPs0dyN3auk8CqgbMbO64
 Lq3GmKw8Nh8UI9k5b/m+xUsvlBlz0TVp3Ewa8tyww+Dgro5QsDFDYHutgcJvslol6gS7Q0DU3rG
 ksz6QT/Ps/GuvDJpcKejLfvuJWl0FiaQLf4gQXfencQrouN5kpda9xZHxd0CX6uGCuPmcIaK5RB
 cNQhHK/UMBPiRVUzFUHoBflAVQ9zljEz3ODpPw+tn/yTUcO4ohP6c5j9r0dx/Q2HjzX7Lqx9RbC
 KOm0SubYg3rVqJXsOooldRPlnxhSEaVZmu1zLPlTAj7UMesQTYkv64PZ8Qovkk6EgVhjQEer9qM
 wAZgucCqThGi/7zHcFHQHW067rOiQ5svf8WjzWjY/fvETGakMEFRKh9jrpMEoVV/3Dhc=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c3894104edmr885986285a.10.1767949593049; 
 Fri, 09 Jan 2026 01:06:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNhlqG1qVA0WeSBPAv41iXJojsZ0EgDiNOaWVzG9AckeDmRxc+YXyNI/94n7ZKvJNWAxmdPQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c3894104edmr885984385a.10.1767949592559; 
 Fri, 09 Jan 2026 01:06:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4479sm9806221a12.1.2026.01.09.01.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 01:06:32 -0800 (PST)
Message-ID: <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
To: Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960c51a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=xIqhFIF2P0JOsuq1WLcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LETT7kchJF5tw2kZ64hAtGxa7CrDPOvk
X-Proofpoint-ORIG-GUID: LETT7kchJF5tw2kZ64hAtGxa7CrDPOvk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX0NfFzTS1Piu/
 v8ZTNAJ05eoO49bJM++AFF10yJJJpLIPJz4qxI9+clxBeG7jfhCSMbjXh508ONWVXHSrs/BYC6q
 CZbmcUkw27XVxNGf3Er58ZIVM2+NGS4gUJB1PzAPpUye+7M/ObBmsDyzXaH4eJvUB+v6jaZRHQV
 wnbjNZV1gQzBwgd2aiRCovppkSvCYtzd06Cu9N5XgwrxcafHqcNZ2dTgqHbrzNvBP2j96WZ/Yxq
 mjIRe7Dv6F5Dy1yGYhiqKlrY93r5GEB0a2/BTZCPwGd/Ia3tccDn2DohxRmLU7/tVPyrZqWJdz/
 xAqDOgBlR7blmq2WDaA/vZDSNyV5t9emvE1N/6iGB/5KsUgX3FC8GtCTlzp+yBeWdKXawu+39Mm
 D9nu+5duaSJ1VABkDnyvHYLZhZAR0UKPQea/+g5oMDQ3Z74aC0MkqIFx7s7IBY1LP2qStrRA99A
 4kcZIun9TeHjZLTg53A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
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

On 1/9/26 12:29 AM, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: msm_dp_ctrl_on_stream(): unexpected end of section .text.msm_dp_ctrl_on_stream
> 
> The zero division happens if the else branch in the first if statement
> in msm_dp_ctrl_config_msa() is taken because pixel_div is initialized to
> zero and it is not possible for LLVM to eliminate the else branch since
> rate is still not known after inlining into msm_dp_ctrl_on_stream().
> Change pixel_div to one to make the division well defined in the
> presence of an unsupported rate, relying on the DRM_ERROR print to
> indicate the error to the user.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Link: https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601081959.9UVJEOfP-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index cbcc7c2f0ffc..e4731c059ed8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2395,7 +2395,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  			       bool is_ycbcr_420)
>  {
>  	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> +	u32 mvid, nvid, pixel_div = 1, dispcc_input_rate;
>  	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>  	u32 const link_rate_hbr2 = 540000;
>  	u32 const link_rate_hbr3 = 810000;
> 
> ---
> base-commit: 66691e272e40c91305f1704695e0cb340cd162ff
> change-id: 20260108-drm-msm-dp_ctrl-avoid-zero-div-be5dc40cbc18

Dmitry, would it be beneficial to throw an actual error when the rate is
is mangled? i.e.

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index aa2303d0e148..4f710b8e6bc6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
        return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
-static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
-                              u32 rate, u32 stream_rate_khz,
-                              bool is_ycbcr_420)
+static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
+                                 u32 rate, u32 stream_rate_khz,
+                                 bool is_ycbcr_420)
 {
        u32 pixel_m, pixel_n;
        u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
@@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
        u32 const link_rate_hbr3 = 810000;
        unsigned long den, num;
 
-       if (rate == link_rate_hbr3)
+       switch (rate) {
+       case link_rate_hbr3:
                pixel_div = 6;
-       else if (rate == 162000 || rate == 270000)
-               pixel_div = 2;
-       else if (rate == link_rate_hbr2)
+               break;
+       case link_rate_hbr2:
                pixel_div = 4;
-       else
+               break;
+       case 270000:
+       case 162000:
+               pixel_div = 2;
+               break;
+       default:
                DRM_ERROR("Invalid pixel mux divider\n");
+               return -EINVAL;
+       }
 
        dispcc_input_rate = (rate * 10) / pixel_div;
 
@@ -2458,6 +2465,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
        drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
        msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
        msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+
+       return 0;
 }
 
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2525,10 +2534,11 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
        msm_dp_ctrl_configure_source_params(ctrl);
 
-       msm_dp_ctrl_config_msa(ctrl,
-               ctrl->link->link_params.rate,
-               pixel_rate_orig,
-               ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+       ret = msm_dp_ctrl_config_msa(ctrl, ctrl->link->link_params.rate,
+                                    pixel_rate_orig,
+                                    ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+       if (ret)
+               return ret;
 
        msm_dp_panel_clear_dsc_dto(ctrl->panel);
 


Konrad
