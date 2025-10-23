Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3065C00DA7
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 13:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6BB10E3DC;
	Thu, 23 Oct 2025 11:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG/7kiHs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405D210E3DB
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:46:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7YJCh011783
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MxuIotyBL55oBcMXr+JxN4AV
 8Gzau+khOnLw0uMLwiE=; b=AG/7kiHs7N6pOQg3k2714gtxaacwe+b11V+Qxw0I
 Gu3nGXyQXnnl2wcGdF4vMjXMe/9qh3BGYvdzCS0MsPOsKxCTt/wzX9Rq1tl2xrbU
 73PCUnFsHIskxPhes8UiAHznc8EZcKfCyUud6Wvtk9iD71ex9VJMS/PMvMgfMZMh
 nHr3826/BOjI8mxOxiIhGQJZKLIdayhTdzbGifxonGp2Ot/2dcR6VAqaQ5CPKyKx
 7OOdihE1qqqXk2t2Rtmgx0354pQ2uieNY437lT1DP0qdHgHr12jP8xDC1IfgsH+9
 fRlKxhSQ6lyIuk8OotssUFYlf49PYcTYFgoQbXxDp03SwA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524aefj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 11:46:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e892f776d0so36413521cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761219974; x=1761824774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxuIotyBL55oBcMXr+JxN4AV8Gzau+khOnLw0uMLwiE=;
 b=vTN41Jrpk2AB+hQLwr/gshIar0Q0E7HMOMNfl4L5wkLJu+SwjHeLXaAG+wwb2dUJ+c
 LsDDf51dKh1oNvdcH1wIxPU8gD0tioXv1sdU8UDI6bfUDZnfx7tyIhKw8Do544vxV7pL
 JgayHOIiz1YPNbl4sIFVBp952W+ze58uZV0uSpNuBa+8OwhtszlpyKYjPc/HwmOe56D1
 RaFv1i2HGAAHk9QIUuzk05TRHCbToDpHHBjgIapuv5/BDqOCZxDF+pXVi2IPb+Myn+c9
 R8Lk6TvewBI0/uXYnX4DdeJ96P/KO/FogHbbKKD+oDmbxToEFMaIa43EdbJERCrOewjU
 xk/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT2hcBSsm0yHbG4OyyOx45Nm7TUXsuY2rgqdKXiYNWg0ly0ymLE4ggEDT5QniqOyb0ExocCf+OIoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUu/nn8WHFV/69DkLIGY704qj/3kBsGB+mu6yQSP2R3py+baXm
 wKexbpGyJqWmNBOJ4gpmKZAL9HdOIqC9pMq/8TzMyOupL6yKseRZ8Ti+vndVfa+e65xF5RDC13g
 vthXI8QEIW+9uFGYLhcgtjOk+quFng6F43ETJlbaiHij4nLBENVF805QrKuBF3i2lRZxcI9k=
X-Gm-Gg: ASbGncsXch1EZ+SociTc63D7FQx0x1xHrQFSs1e/QEtwhWCMVMnsoF8m9YLGuiCWIda
 n/CYV5aZkI7Hl6x3f67Fn0AxlCz8Yolqq3twwhy8f1MZsM9lmgEguOpsJTP/NloToYzkQm3AEkq
 02EZcPAixpYkrlqMht58oWapKktD2tEf0WycHxquEs3D6xC4hmp9+yhcVWcVCSKdjHeduuoWB1j
 ddt6gncTOjVP3wfAjlje2Tm6fudM0rBXeO5qtbGCr1rlihtM1FOwlwRGpkdD4s2a4dqHPvDSBz/
 Jk+J1WmU3JtYnF/EmP13Jl6Y0IZlqkwKw/j2xUfzKLM6Mc+VOMQpQhtGCs1A5qjDb1G+CsqDonQ
 bZuiikF9Q4Zo631HAmkKJTPt6EwfL3Jd8yT6kXCN58h2fOtFTP2WQj+nPV19A9xOtv6tErRkk2U
 G1dmTuuTgahfPD
X-Received: by 2002:a05:622a:1a21:b0:4e8:ac66:ee44 with SMTP id
 d75a77b69052e-4e8ac66f4a4mr250238131cf.39.1761219974202; 
 Thu, 23 Oct 2025 04:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8+pCnO8ZvR8ffZYHTiXBpe8PitkiTaa+bMCiZZSPHl7XKSC3gu/++FOyxZx7Quca27fB8MQ==
X-Received: by 2002:a05:622a:1a21:b0:4e8:ac66:ee44 with SMTP id
 d75a77b69052e-4e8ac66f4a4mr250237771cf.39.1761219973768; 
 Thu, 23 Oct 2025 04:46:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4d39b96sm656447e87.110.2025.10.23.04.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 04:46:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 00/12] drm/msm: Add support for Kaanapali
Message-ID: <r6kjuxajnimaqazeimzc5gscv2qxudjzkyooxumzakjzojibbl@2jiw6duxfbtz>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX17L8hP4ZecsP
 rhC+iwh1q8GjlBbtmYTUXm+D1o9JK1TlFwhuJjuQysC16FHdniGBOhukx/fgYJj9qzHW1xHnrxL
 I4N/M7NlkL65Rar4EXQxJ4BgdspTtSYKjxV6pQQQQgygtqJoFn4fzJpQKmvQPnM89wT04Akjoxw
 /SCy8oaZSe6O2j5adjJ2gAjJLJZvYQZ6TDUYb/WAKB9ibmnnkAyWz4OPri5+foI3dIINi+D5JN0
 JGeqbiYI2gg7SvLZfWMYZXXtYrRkbyFQX08JVnriIQGNS2YIwSG4ap+LOzXbH937p+WjUp1X16p
 sK1cd91tDPVGjEwHpwvtnLTZrDl6oYLb+nmxPa5IvZnWUWHd9D1C8E+RRxJwsFSpNyhlXNetC74
 GllLaBf+Tj7qwSTg1AVEx8Ke4IHxQg==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa1587 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=PFSzt4Q9d-Ge22CFuaAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: CPWXABWz7B5G-6c9jsi0mIyTT5WOX2Cq
X-Proofpoint-ORIG-GUID: CPWXABWz7B5G-6c9jsi0mIyTT5WOX2Cq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
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

On Thu, Oct 23, 2025 at 03:53:49PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
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
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
> Yuanjie Yang (12):
>   drm/msm/dsi/phy: Add support for Kaanapali
>   drm/msm/dpu: Add support for Kaanapali DPU
>   drm/msm/dpu: Compatible with Kaanapali interrupt register
>   drm/msm/mdss: Add support for Kaanapali
>   drm/msm/dsi: Add support for Kaanapali
>   drm/msm/dpu: Add Kaanapali SSPP sub-block support
>   drm/panel: Set sufficient voltage for panel nt37801
>   arm64: defconfig: Enable NT37801 DSI panel driver
>   dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
>   dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSi PHY
>   dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
>   dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali

The order is wrong:

- bindings
- driver changes
- DT changes


-- 
With best wishes
Dmitry
