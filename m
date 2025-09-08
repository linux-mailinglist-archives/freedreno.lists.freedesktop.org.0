Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48388B493B3
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 17:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251BF10E157;
	Mon,  8 Sep 2025 15:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFIdD8hN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EAA10E157
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 15:38:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58890aBP023900
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 15:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7VfDo+K2YxkxcNLtYJDXPL/1mkJcb89EfTCTUVk46hQ=; b=GFIdD8hN8FyF4bNq
 dhcqYmW+iPIZ8TBq67UlEy0/8yzA3wwwpTrRyxIPuKOEergP7gnMI0zpbK/dn29f
 XRqI7AbVN8X2shw6sNLMD/hNfk/37wp2yktw8PqpDnEJ+CHz+tAX+NK9hKxUE/iX
 Kr+pkHyJSI6G7+xZ0d9oljO+hlnTjrVP3RZJdx+KAHb5Wy0Qoo5PvDrYBP1CjupA
 SsTpnwpGbRKas8Ag+0PqeB+SX/1deC9XXir53r5AfC1C3MEhkFeKQBffcu9Ydqv0
 gcS5sXoIN5Op9wOfZIvAEuhjF+sMleHovORE50aHAyTAUXWIR1EO+MLGC7xvkljz
 dQJwjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a4xhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 15:38:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f15a5f3dso6676151cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757345884; x=1757950684;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7VfDo+K2YxkxcNLtYJDXPL/1mkJcb89EfTCTUVk46hQ=;
 b=LDB1Bb/UR88TctsU36znx1G0m0590mO4TI9fEahLueA5udLZ6A+hovJplB9B9oi2M8
 PAlta/PnUxcH85+zuObU+z7/L18QVMNfWoTcgLR2/4fV7o4wQJdNLC3ptf7yV4D/MlxT
 jvIV24/Y4yko70+AGiEzLp60vNsbbQq+tUI7kQ4uXZapqVP9beQT+uCNR6srfvv1hrxJ
 Kf61vmsk7L9sO8+6jWUaP1o7vm6EmikTqJ7vWtdD6f+FsiHclEWa5FoBF2W65AvZHAOB
 1jKoplTc0LJwqh6QV8QVDiS6PwKFxV5Gfhj5NeFO6CKCyu40DsfJh75QVU3fxro79HyC
 sg/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsHF4f2rJ+8WDM4at3USM+Ai9n6dm4tDgLUoqnuuYkWZUJeZM3ZnwqTXwriyY+mpHEnCMV8jThzXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6cqpbjVo42UqC3tD9hBps8Ro4z6HeIGPc37lTPfckrEQQDL1v
 j/oQsj9plE5IIOSqRAeYvYru7dbkMq+gw4roKYq25xhf6Hbg8kKcrJAkpoKZAILAvRiavCkYTny
 wqknifiO6ekJ9jgPGQAbAKzMrtQeuQZE9aRJpCbAY3U42rhou204OWswteuXmJ6rCnv95Kq0=
X-Gm-Gg: ASbGncsmeuOtGRPyO5RrRKwuoVlK6DfEpfeAOcN1pDxFncfJ7eDQmVgXUHtq3Y3A+ZW
 +k2CZxipG94jzTSn4Ks8wtdkLFjExbiZtSC3+kTsQTofqbCb1HnHye8MGqEiekWAJ8vn4yE9+KN
 Hoztf8JfSovbTRmY1GUHWb9Kpj+VWTlLAes3zhXOHygixGthxDbK2zLdqvqqqQMTeszvYs7DqWi
 Uls0/9r5szsk8aJKyckUZ45azqLajG5jFXmrh8p9zgC0zVDl+YQF+RBtQm0Vv1pRlqk+rttrJJJ
 dPebgXSmVQQFhbjw+CqXizvshITWxFUgD8yybKVtLeR+InlKJw57i/gjCFDUqhbghAxwCmJ7HIc
 z5pEO5mhpBNFSIpEPYxQDog==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id
 d75a77b69052e-4b5f848d05bmr58304571cf.7.1757345883525; 
 Mon, 08 Sep 2025 08:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcsvpKBaQ4jCcWP5NtvuePywTOTY5oNYfv92gdyrYQkqbJJAvrzNLEIVI6ZIbznl8lDhI5wA==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id
 d75a77b69052e-4b5f848d05bmr58304161cf.7.1757345882765; 
 Mon, 08 Sep 2025 08:38:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0d9b1b53sm2408307666b.96.2025.09.08.08.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 08:38:02 -0700 (PDT)
Message-ID: <59ac7827-6258-4268-8b71-4cbcbad859db@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68bef85d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sRrLox2IjJLVq2cxUxUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 0IXu3Lv5_4A7y_KBhr6emqdKzFFHwT5Y
X-Proofpoint-ORIG-GUID: 0IXu3Lv5_4A7y_KBhr6emqdKzFFHwT5Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX+UeeqjmLiVfG
 2uKEJKunV2bC/ahKQb3U4ADnj46xLreSckFt4yQWPJruN1e5qFO+rRJ0TSg36oMr4Y9PhqCtQpS
 Voja1II4XRc/IU4lFyJ7FWIZlQxb+hynid8+KQ/QQEcDRRpiKFkiUUih3QLr0hACJUqKaDq2ZwO
 sDjyWCUDwcz+NCHL7BsXzQSDRlTNRyj323kTgELHCUNvU3i/P/vM9WVil7MUGGuMHWrr5WkDz5c
 Jjn4MMpLe1AyfquDSHWglqfRjCJWin8GkWKRemfko+6wW9LBWeOkRz/T34zQwYagQflXCqdqNx8
 zyfa85yF/JviyJmIHEZ3m/PTLV42SARQMtADZ5eMpXdC/B84xCX4zvJnYxXUpdEXqF7nKdJrF7C
 q+IZ3The
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On 9/8/25 10:27 AM, Akhil P Oommen wrote:
> There are some special registers which are accessible even when GX power
> domain is collapsed during an IFPC sleep. Accessing these registers
> wakes up GPU from power collapse and allow programming these registers
> without additional handshake with GMU. This patch adds support for this
> special register write sequence.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
>  3 files changed, 90 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a042ed4f19d8282ef5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,84 @@
>  
>  #define GPU_PAS_ID 13
>  
> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
> +{
> +	/* Success if !writedropped0/1 */
> +	if (!(status & mask))
> +		return true;
> +
> +	udelay(10);
> +
> +	/* Try to update fenced register again */
> +	gpu_write(gpu, offset, value);
> +
> +	/* We can't do a posted write here because the power domain could be
> +	 * in collapse state. So use the heaviest barrier instead
> +	 */
> +	mb();
> +	return false;
> +}
> +
> +static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
> +{
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	u32 status;
> +
> +	gpu_write(gpu, offset, value);
> +
> +	/* Nothing else to be done in the case of no-GMU */
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return 0;
> +
> +	/* We can't do a posted write here because the power domain could be
> +	 * in collapse state. So use the heaviest barrier instead
> +	 */

I'm not sure I follow - what's the relationship between the write being
posted and the power domain being collapsed (i.e. the hw not being
powered on)?

Are you trying to get rid of the delay that could happen between this
write leaving the CPU and arriving at the GPU (which would then be
woken up), so that the 1ms poll below has greater chance to succeed
because of how these "special registers" work?

Konrad
