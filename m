Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43586CD5E9A
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 13:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0AA10E640;
	Mon, 22 Dec 2025 12:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1IawWYV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYAxL5PQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD5110E640
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 12:03:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7pGjI3935865
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 12:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=p2gg/ryxBBsJ2sBbFd283vDJ
 AmmXdp+K9EbHpIl1scQ=; b=a1IawWYVWby0G3PXzSFItLN/rCj0LdDnJLUKwePZ
 kuatO0+PWocscOcqAijMRUdEU3RWA3uEFATsAiN0jx69AYFmPoC4IKQHXBsNTYLQ
 AzRPyBDiyCEF8Q0VZVckwg3G6AEmgZBX0aIUN8r4gcNW6HSKX7d8TKqVn6UqDz34
 1swS36pZ+K0NcBczp9soYOhSmy07gom13FFLROTNytzDAoMhHvcOPHmvJqnNqC7c
 /6bnBGQD0Mkq3G/JVHhY8GsMjR0aqaK4JNt+BNOnoOiNV108ZrROkZPH1aAR9Lez
 K93HF6zYgf9Eg8KPgqqBWFCsEaD7C86X4cYC/iJPQDo+xQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmvy4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 12:03:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34e5a9f0d6aso3781012a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 04:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766404984; x=1767009784;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p2gg/ryxBBsJ2sBbFd283vDJAmmXdp+K9EbHpIl1scQ=;
 b=LYAxL5PQ2CafSwwriPNiL12VllLYn0Viz07uQKieg+VhBhtOmek0qOG5dLKSOFG6K+
 PEaLZLIP4sJ8tAosL8rSVj7i8dz4EfLpx4AYs7vw07HXVgTc1J4IWVD+TsGweOdsTCZn
 97dU1swvtUsyT/cmeIwHssVUPW5Ss+pTxlesB8o9pfC7n7NAFtcsJOL08YIDRszTek/k
 lorDwDtQJemqZ665IOT2wwGGoXVzuNmuP/+nQikLckHRdhSXYym8AkGOcWpoFgYNFC3r
 OViPdC2dTzWUYwq3NAvUkYTXjaaE8iUK1P9tJkYqqEg+JVF3J/6ldRJizE6l1sPNFwWO
 ZHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766404984; x=1767009784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p2gg/ryxBBsJ2sBbFd283vDJAmmXdp+K9EbHpIl1scQ=;
 b=OBinM1LvjDRB2ARhcDrG3p4D33nhK3qBnCHY9PWCvZ3g08SIU4Fm9a+TIrwxa5BqJ7
 qg8TdjSHASCSWfJIsWMxt7G64OlqzaSQ5PaEPdavTLjMyqAWnYSUyJl1IgLKqbQFQEz1
 173A8qCReM0LpMG0HzwZfj2AcIOzi82jYICCMYu9LFVjO4VkaA/d3mbhHf4ml7WZo4Cu
 892hwqEfa1d21PvpGEh1Rq5Z/jGAY/Z9Nh9vRP0ED1ngQHA7hBrWN9tdCvexl55x/SMN
 SVLeOrxe9Bk5DREw1MuBjhVJKbp//2f2euJOuX0SSwfp6nV5mTa1A4YQP0fcJZzsvGPd
 yeAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaKfwQ4PccHhdPrPlHy/uRBZwwiPLqRS7R4hCU49dlAF9r9xKMgwA3DhsatogcGPrfqSRqe7vmYEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4PDtv1gDgLhEKWD5/tB6mNCsKFmR0t4tNgQF6aLc2nU93kYtC
 DRJTR15xtYw0WODCUKsI3TQ2vBIf/4pFWEfearbQ35Q6dJXccqApUtgP76fuAgI2MpPb0oxcyI/
 yQWRRhal2aSzs+o6yBggkIF2vw0aMpcAEwmiDdr5Mlf2TEq5Hfq2FoVmbv0LLDGv8Oq4XZN1BfM
 ZvNaohNtXvk62jVsXu/T4sgei33WEwfHYQrP5fbtgBYvMt1A==
X-Gm-Gg: AY/fxX63T6UgnozGTtcjzZhIm0nsqJ2dpoFMxf3Ak9jgeHKUN7+ONAKiG+CGXZ48OxN
 beBgXfCRQFApfZbvyr0FXi/lGEFiwquSWE/o2y+IleqEL5A1Vudh/CccHlRvDt2PkWN/yOAsZ7R
 gP+zoDGAvhQQ2ubUuRwM/94B00w2iwGQwMbunCenXoYoT83S5BmRNRQANVm4xhXz3X+w6IsHfKH
 Y4LsbFI
X-Received: by 2002:a17:90b:4c4a:b0:343:3898:e7c9 with SMTP id
 98e67ed59e1d1-34e71d6901cmr12908828a91.2.1766404983869; 
 Mon, 22 Dec 2025 04:03:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUCY5ziK+Yi6Z2VGIwSN1Md/1ZaAhYLCl4h0bRtjPtwJr89S+ORuVEAoEdJaNMJqVGAHBOi1aGU5whF+6LzXc=
X-Received: by 2002:a17:90b:4c4a:b0:343:3898:e7c9 with SMTP id
 98e67ed59e1d1-34e71d6901cmr12908770a91.2.1766404983257; Mon, 22 Dec 2025
 04:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:02:52 +0200
X-Gm-Features: AQt7F2qayOLXWOsVKODIpcNdatE0N7FpfRdRn0Mn_n6HFQmRjmFa3GkTXG1ipgY
Message-ID: <CAO9ioeVXqVJ=d1xArUJOfz89o0UTVMcUZknMpHSZ-k4RCTZK3Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] drm/msm: Add support for Kaanapali
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69493378 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5hTnvsBZC3hnunZ897kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: XPl0Q8iaJh0zvpCRSVNW2ksNIDJjV0Zx
X-Proofpoint-GUID: XPl0Q8iaJh0zvpCRSVNW2ksNIDJjV0Zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwOSBTYWx0ZWRfX+XJFFoTtnJtb
 7enXykhqpsDvwe9phKRIrSaLHeWblOjr/YZnUxdp9Srf8A5dIkUaIW190COKMREXjB2F9eVlrWv
 fHB2OQF7HIPFWXo33cWMQNLmDcJnWJrxPkzt8DF8XaAlFSuRiXgMhl5sOkPk4+cJij91oxtMgTG
 Yx/4LVTxwoLhDoIV/pitCQTOAgt2JaCZHoune012lauwZmXXRzHH/YWo1QwbMSSVE8ESqrzreNN
 AIZYuRb+Y0CfnnkTnrI6jo9y6jxutxVqbFvYc2hvbd4VAFtCXgiTFUc96IgM4Lrpkw56gIoUi5Y
 +gbjt0r8wyW+CC7KM0WW42AO1hzly+I0+VeHSeSeDbHr+mF37a7CP/L5yvxCsrSwwATE4MFXgpG
 RD3VQbpSj9PoITz3km8BrlJkapfUn1K9tVwfcCpCU4RBq9xLYHJBXKnhuC0DoZ8CmL9ku3+/9Ns
 /6kYR7zBv8kcaaCmXpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220109
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

On Mon, 22 Dec 2025 at 12:24, yuanjie yang
<yuanjie.yang@oss.qualcomm.com> wrote:
>
> From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>
>
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
>
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
>
> We have already tested the display functionality using the Kaanapali-mtp
> device on the Kaanapali branch of kernel-qcom repository.
> Test command: "modetest -r -v"
> kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
>
> [PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
> compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/
>
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
> Changes in v4:
> - fix qcom,kaanapali-mdss.yaml compile error
> - reorganize SSPP patch order
> - fix Dmitry ohter comment

Which 'comment'? Please be specific in the changelog.

> - rebase on top of msm-next
> - Link to v3: https://lore.kernel.org/all/20251215083854.577-1-yuanjie.yang@oss.qualcomm.com/
>
> Changes in v3:
> - split SSPP refactor patch
> - add devicetree email list
> - fix Dmitry comment
> - rebase on top of msm-next
> - Link to v2: https://lore.kernel.org/all/20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com/
>
> Changes in v2:
> - Drop panel patch
> - adjust patch order (bindings then drivers)
> - add dpu_hw_ssppv13.c to complete kaanapali SSPP function
> - fix bindings example dts compile error
> - fix other comment
> - rebase on top of msm-next
> - Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/
>
> ---
> Yuanjie Yang (11):
>   dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
>   dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
>   dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
>   dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
>   drm/msm/mdss: Add support for Kaanapali
>   drm/msm/dsi/phy: Add support for Kaanapali
>   drm/msm/dsi: Add support for Kaanapali
>   drm/msm/dpu: Add interrupt registers for DPU 13.0.0
>   drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
>   drm/msm/dpu: Add Kaanapali SSPP sub-block support
>   drm/msm/dpu: Add support for Kaanapali DPU
>
>  .../display/msm/dsi-controller-main.yaml      |   2 +
>  .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
>  drivers/gpu/drm/msm/Makefile                  |   1 +
>  .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 123 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  56 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
>  drivers/gpu/drm/msm/msm_mdss.c                |  10 +-
>  22 files changed, 1474 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
>
>
> base-commit: 06aa394d58c11406569bcbd4a69b81290edf3f63
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
