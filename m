Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48192D39932
	for <lists+freedreno@lfdr.de>; Sun, 18 Jan 2026 19:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928F210E2DD;
	Sun, 18 Jan 2026 18:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CV27rbYX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G81nQ3LY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93F910E065
 for <freedreno@lists.freedesktop.org>; Sun, 18 Jan 2026 18:38:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60IBpt0F2054720
 for <freedreno@lists.freedesktop.org>; Sun, 18 Jan 2026 18:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=uPueFjx6XXI3IgjOBwtEmTId/PmNsrUzTFcwr/mBHzk=; b=CV
 27rbYXPYZl9F71kuekp78woUOTLY3TMuwn0+byQ/155TQoShTdu3oayFm0g7Ce3A
 lYQ4qJVIwVLHQQs4K0NWmlJR7bbaCzT5lsPk5C536S1woy26gx9VjGGLPCIykNWD
 31RmkvnXio96b3FF/N1UkQxUdFgjn6gkJx81mMtggyCJlvQMH1KpBdrApG1TRpdb
 5VCiQuLugM6C6HgBgYE1AZ73Ees852ZEr+hJUdxsRaumduFtFv0RpQQhD8j8izLx
 PbnBUPTtSku7XGxw8cYl3Iw1lcT++kGZF+jKlbkiY8Axcua/QoVSk44xvowz5D+q
 jBZob4VY3c/INJ1FcJMg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqysjb629-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 Jan 2026 18:38:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-45c8d5caf62so4029038b6e.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 Jan 2026 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768761491; x=1769366291;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uPueFjx6XXI3IgjOBwtEmTId/PmNsrUzTFcwr/mBHzk=;
 b=G81nQ3LY8/B+H+RvmB6jwXy9QEM2d8KQi6QjVKBhYP4QYT0KG5OGPZkMpASGirgAll
 C8yVTB0PqLpMkjdDNy89W5I2CsOibwk8T0HrizNVn/PdLN8wLs9y/I3s69dWMP7wZmLw
 h0ywf+phKpOA+f9/qlWuvQu8njbAQGyaxm7Ads8NNXZ2we/qMRDiuD0+j2pL2gXhmvu1
 EQPGyBMwuIkj2rMS9jZkbn/aOQAnwGcl0MAzjIegbLEIp7zqOA5KcvaxCT4BeAc8Nh05
 CZsiCM5yMpInoIJiR4HhxnjqGb/UIis/IJlhnnysO2/y/m10ryjAWViRV5/pSbrorkQt
 A4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768761491; x=1769366291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPueFjx6XXI3IgjOBwtEmTId/PmNsrUzTFcwr/mBHzk=;
 b=Rmlu0pUg6eTGFA/amjB1ADSzZEVtbIeWfF3tFmxpPcrUBokUMBYI0ubrzh59FHjGp9
 5K45bXN/1ljdVEhIkGuXjoPcCAauJk+rJ4xYlrzQEIbYZn57fkUcLAuf6pQ8c3MEBfBD
 PJZlJ2VZi7Y/yINuiJ9Kd4bieSrd+rTHNetBiUjsbsDi0JmUb0sGFBBq8sQa2QNJE25S
 P/zcRGMrUk5e0DlxGj1FesgpSekfGgaWV09HfXxEPhJo8BZZE7gq0Ee5KfnZNLBlZ5sA
 A1u9KqyVXDsrksnYA0pH2FukDaQlfKjvTsy6N+4jkS2LDVr5ILD5K8G9C7ihdn5OeWBf
 Dmtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUyfzQCanJqkVDsuvy1dEtL0YLmx20Os4f8xpE6iNjzait46AeIYasZJlXZEhfsMBkRer/Gkh9BJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXUl6i2Peek8dN/v9u1YmjBpJ2WyVidfuFRA0GOdm+IGYHROEl
 wCGsa1DATRM5o0uAJs04h0u99B6jdyJEnjMUcZg1mjV0GBlk7ubDTS9gM9eh+JOoP2ObvhIztk2
 Yrj05FTNkFLLryQA5nNO4DyNHN1FUPhiUgTqLYqOlsSVmRU05cy74d9X9VS/I1tObG/HqV1TZwo
 nfPw7ibN41oy2iLrFJDhOf6rPEuBBYcnQIFPJ9uqhwqLtt5g==
X-Gm-Gg: AY/fxX7yRpIz279hSE3T4+V46wMdgR6m1Y8KOkaw5Igk+Gz0jtyYyLHeJYfuiIaUphw
 T231pYcsj4bXAv60yMrX6UirnQBiD7oflL/8Q+mUqiAm7T6Mn0dNTUWIFae3aXzrs9mSNp4Su8I
 ZKZRxe6cGPRVAjoEEMX9tq1pAb6uq9cNi4LTHPIpQqKFE3SUJta0/d94kHUFHnfqtzLA==
X-Received: by 2002:a05:6808:4fd1:b0:450:bd1a:19b1 with SMTP id
 5614622812f47-45c9bf853dbmr4708181b6e.7.1768761491175; 
 Sun, 18 Jan 2026 10:38:11 -0800 (PST)
X-Received: by 2002:a05:6808:4fd1:b0:450:bd1a:19b1 with SMTP id
 5614622812f47-45c9bf853dbmr4708156b6e.7.1768761490719; Sun, 18 Jan 2026
 10:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
 <20260117-msm-ubwc-fixes-v1-4-d5c65ea552c7@oss.qualcomm.com>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-4-d5c65ea552c7@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 10:37:59 -0800
X-Gm-Features: AZwV_QgKLlYDPQGFk2klj6r5W2bSSRNovXrFJIeJ0DKvvOwX1LEbt5gRB_dHw38
Message-ID: <CACSVV02muSij-mYodK9uXRbe0WYso4DW_43_px_w=FDmK0=V=A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on
 UBWC 5.x+
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CaAFJbrl c=1 sm=1 tr=0 ts=696d2893 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pSJFZ7BqxfWaFcy_hbQA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: HAklUAmOB1AEASAnNF3YrUSmUecKU_E4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE2MyBTYWx0ZWRfX0FVsQaqYs+A7
 PR7ZtdpHPIdyFEWrP9hjAMhwqki5tCuBX+pPo0MPzmZSk8Ymt7xiay3ivNV2VuRW/oUtT5dqZqu
 50Ry8ankTGRw3v7FMEOsbcOW1DGCmbMiKdFvJINEcu8/78MSxlnhOB1Fqn3mWNsY5qoh9n38BlN
 UC4xiUcKyfk6guGk6G/nNIdowWdSSePCK20JFJCOPFJ/qTtrcb8J99Y2nqcfAMMGeTQlAElMfqn
 bDfLSmVE6ZrH9L9gBVJnuqfwDRSC+z4he4rEZsOR9fR+S0M8f90Akcx4am5ZVJhYxiF/IMy38Yd
 V2Lll8KqVp/cnYg4kBAc1yWlIDwsjFCaIjUA5ZKy3iO0e3tO4O3jmmRTakMFAh9FsUCj+zk8mEp
 zPWKEYHFdQxlFUsCsy9KWa8RxBakgfokCFJbXORcpqcGp1rLv+Ynq0on2E5oxT26D19ChY9uTwk
 VHS37fZwulHtLIX2RUw==
X-Proofpoint-GUID: HAklUAmOB1AEASAnNF3YrUSmUecKU_E4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180163
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Jan 16, 2026 at 10:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> than 4.0. Replace switch-case with if-else checks, making sure that the
> register is initialized on UBWC 5.x (and later) hosts.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 41 ++++++++++++++---------=
------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_hw_sspp.c
> index a99e33230514..b0c97f5e47ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pi=
pe *pipe,
>
>         if (fmt->fetch_mode !=3D MDP_FETCH_LINEAR) {
>                 u32 hbb =3D ctx->ubwc->highest_bank_bit - 13;
> +               u32 ctrl_val;
>
>                 if (MSM_FORMAT_IS_UBWC(fmt))
>                         opmode |=3D MDSS_MDP_OP_BWC_EN;
> @@ -286,30 +287,28 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_=
pipe *pipe,
>                 DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>                         DPU_FETCH_CONFIG_RESET_VALUE |
>                         hbb << 18);
> -               switch (ctx->ubwc->ubwc_enc_version) {
> -               case UBWC_1_0:
> +
> +               if (ctx->ubwc->ubwc_enc_version =3D=3D UBWC_1_0) {
>                         fast_clear =3D fmt->alpha_enable ? BIT(31) : 0;
> -                       DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -                                       fast_clear | (ctx->ubwc->ubwc_swi=
zzle & 0x1) |
> -                                       BIT(8) |
> -                                       (hbb << 4));
> -                       break;
> -               case UBWC_2_0:
> +                       ctrl_val =3D fast_clear | (ctx->ubwc->ubwc_swizzl=
e & 0x1) |
> +                               BIT(8) | (hbb << 4);
> +               } else if (ctx->ubwc->ubwc_enc_version =3D=3D UBWC_2_0) {
>                         fast_clear =3D fmt->alpha_enable ? BIT(31) : 0;
> -                       DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -                                       fast_clear | (ctx->ubwc->ubwc_swi=
zzle) |
> -                                       (hbb << 4));
> -                       break;
> -               case UBWC_3_0:
> -                       DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -                                       BIT(30) | (ctx->ubwc->ubwc_swizzl=
e) |
> -                                       (hbb << 4));
> -                       break;
> -               case UBWC_4_0:
> -                       DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -                                       MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(=
30));
> -                       break;
> +                       ctrl_val =3D fast_clear | ctx->ubwc->ubwc_swizzle=
 | (hbb << 4);
> +               } else if (ctx->ubwc->ubwc_enc_version =3D=3D UBWC_3_0) {
> +                       ctrl_val =3D BIT(30) | (ctx->ubwc->ubwc_swizzle) =
| (hbb << 4);
> +               } else if (ctx->ubwc->ubwc_enc_version =3D=3D UBWC_4_0) {
> +                       ctrl_val =3D MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30)=
;
> +               } else { /* UBWC 5.0+ */

Is this the same for UBWC 6?  Should we warn on version > UBWC_6_0?

BR,
-R

> +                       if (MSM_FORMAT_IS_YUV(fmt))
> +                               ctrl_val =3D 0;
> +                       else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but i=
t's unsupported */
> +                               ctrl_val =3D BIT(30);
> +                       else
> +                               ctrl_val =3D BIT(30) | BIT(31);
>                 }
> +
> +               DPU_REG_WRITE(c, ubwc_static_ctrl_off, ctrl_val);
>         }
>
>         opmode |=3D MDSS_MDP_OP_PE_OVERRIDE;
>
> --
> 2.47.3
>
