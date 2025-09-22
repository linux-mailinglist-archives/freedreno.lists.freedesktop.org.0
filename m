Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D54B939BF
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 01:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D977410E02A;
	Mon, 22 Sep 2025 23:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RyxQCKkW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D5810E02A
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:39:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHZd1W008992
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e5TvOCaHalM32QUUJdndPnHbjMULpv/tXt4BpcYo4Xw=; b=RyxQCKkW5kWPhVUt
 3GGAY8PcspEk4oILlwudowluIi8Z+6u5eKYlLEEOiSyDdqlvsabyObnFBMoYp+jL
 BJ8AAQT8WKgG9Uzm96aqnEXEYTYa3u239R27+K8kwxscKc9zu3RgSH4HoFLDqax3
 Q/LQ9lp3tVXTQBlra5ArxzWujzbmK/+JTQ3DjamvAon3Mjc0NNTGD4GwAC4wZmHP
 0SNNkIA+al9Ygp4mObCquxSfIE8E09jYVPbnW1BDiV88K/+B02ArWbkPp7C5CnlG
 /ClpR6MGV2fyjJTKtxZgtiaxubK3uzdgkuYQUdF+XVMFdHRJKXKiyl3HZOToD23s
 1HfR6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bb07gvt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 23:38:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-78e30eaca8eso41117956d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 16:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758584338; x=1759189138;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e5TvOCaHalM32QUUJdndPnHbjMULpv/tXt4BpcYo4Xw=;
 b=MHZG0PF/ZgakvwkV4Q/9VFfxrfEK6Xas6hhr2ZA+59Or6i+brVsR+VkRuxf3SZVxFP
 JxJwo/KgAag4bJEybu8NE2ycFoayRYxlpVo/JxakJdRnnlaEK6AM7xQry4MmbBxTdQAX
 QbkCaBHh+4RYhwgayReFtlyJ6+QAIIev5dAZF+zVG8FEaK6Abjk9XEySHtlF6rKTIvr1
 RntJwxlbpn4TxVlu+CibfWtLfqxCYziNxTXieaC6CEPgL1UA8riDYB3h7uqvqg2VQnX6
 2d4yQnChfFRJDBq9XlBkgxVcbLKwOHB9WzTFsuvuz+uTOJ+J3YxN5vAz3ui+9iatjANN
 vgDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBG0j27y3Q9vUbRMheW1nRd/3elHWPaCYscKm/LxScZR4KIK0cPwXAnyHDRRmT2gbLs/xFy9d8JNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIa3FN/HN75mbO2MUde4Xmv4gM/xQXLW39gwaJEBi8t+nFvxKB
 3YPp/NjivQiXJOIKPcCYAx5jBWCnxnfd9/8qNPUQ5pSnu0zIE32V119SUGTaLoXqtTygpN2ABYu
 CvajQJ17KcCkDaI6AccXKcybN44gjOkoLbFi0uGY5obZ+3UxFhZvUnMmTVawIyDNk39JdhPc=
X-Gm-Gg: ASbGnctRbMCPQQgtNkfHmpm2uiGrtdHUic7ongIrni4ZMiXY4GADZaraWBiLfsIljWJ
 FhTbNvclL03fX2AEk3RujglETz0CIyHTbIafohYkrwUutr3iwYCWIT2JRO0SUwue/vqHr5Qtpjr
 TVU9fYbglQM0XMnKer8QNkttN1O4FJLrF0emysZd4qRHlI+KhFIeZUC3Bdsqltl9iatrLht3Td7
 V4EKMEUOEJJgD7WdDpj/dgqlsIlXUFTKV9AzszV6lpLUTTms1kA8V496abVMPevL0P2Y305dc0z
 1J3rqSt0R9KIY8BN6H4qE3dqMJVisvbORaQJ2ro5kaXFMlM+wGYTVbGjocfiDVfNfLurFv+afZM
 v5MbUxUsoQ8JWs1nVNHWpIhAJklwmtcsnnuksDYJOUJ8w3b0jTANd
X-Received: by 2002:ad4:4eed:0:b0:79c:f4b0:6813 with SMTP id
 6a1803df08f44-7e70381f0aemr8294966d6.21.1758584338157; 
 Mon, 22 Sep 2025 16:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUSFjg5iWYzh+WxjwkEqcZf3xV54AJeAPRjTMWZAiNEPSIO65hMhienoOLDZE1fB+/IhMYg==
X-Received: by 2002:ad4:4eed:0:b0:79c:f4b0:6813 with SMTP id
 6a1803df08f44-7e70381f0aemr8294756d6.21.1758584337686; 
 Mon, 22 Sep 2025 16:38:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b7e33b78bsm2117111e87.45.2025.09.22.16.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 16:38:56 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:38:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <bonlc3rnfizezrobyuazv2cmyu3hqqck7tbk2g5ryln24eiwno@jxsz2rg2dyex>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-12-eae6681f4002@oss.qualcomm.com>
 <bfpgktxgo2hb6dpzy3i7jdr6w4de5boorx4n6qeapct2vre4sn@4z2mnppridn5>
 <14cdf3a4-714c-4136-8c1d-99392e7911f5@oss.qualcomm.com>
 <2ewxoe76rrii4w3n5b6wl32vmatcp2boj75o65cuq5nx4f2a55@7cn6m7oxzu6c>
 <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28eef277-c778-4ffe-94c6-2e90d58633de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HJnDFptv c=1 sm=1 tr=0 ts=68d1de13 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W0oVTkMUdJ9i6-1frqUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: TmUoi_30FDX-NCMMr3D-P7IIG0lcKSnq
X-Proofpoint-GUID: TmUoi_30FDX-NCMMr3D-P7IIG0lcKSnq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE3MiBTYWx0ZWRfXzpQJdBOgGaT/
 8REmwGmyL7wwcCDmSwhMmZrScdahWFkydzxR62TL/WlFnjVU/2eIOV67itRIg3s+4dAad+FkOnB
 ntQzxKGcDRjjDYlUtLWQE4jqDf+Xr305VUbZbOP80iBq64qT9uUn1nYI+vjlPx1gcsyh8wW+/yl
 tnyi9jG8EoaEsEaV2UKQQXvz/efmsxQT7IfC06ypT6eRoQDRqMQO9xJ0LZQqmuj/WedhhV7JaLn
 itnhKc7cedaH60h4g0vK1/dYFf2ZhV2teSehTkpZDibgnkj/3yVkl+ZQ7SvoJhcBI++cfxepcWa
 vK5wS2nX8BHJDEMYiS1FcTm2SSuTd19KMIosotEyTEmizqpoLfxrAyqY1TvqdQDLgJ8GknqcHwX
 5Ab+bSGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220172
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

On Mon, Sep 22, 2025 at 07:28:17PM +0800, Xiangxu Yin wrote:
> 
> On 9/22/2025 5:45 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 22, 2025 at 02:58:17PM +0800, Xiangxu Yin wrote:
> >> On 9/20/2025 2:41 AM, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 19, 2025 at 10:24:29PM +0800, Xiangxu Yin wrote:
> >>>> Add QCS615-specific configuration for USB/DP PHY, including DP init
> >>>> routines, voltage swing tables, and platform data. Add compatible
> >>>> "qcs615-qmp-usb3-dp-phy".
> >>>>
> >>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 395 +++++++++++++++++++++++++++++++
> >>>>  1 file changed, 395 insertions(+)
> >>>>
> >>>> +
> >>>> +	writel(0x3f, qmp->dp_tx + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >>>> +	writel(0x10, qmp->dp_tx + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >>>> +	writel(0x0a, qmp->dp_tx + QSERDES_V2_TX_TX_POL_INV);
> >>>> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V2_TX_TRANSCEIVER_BIAS_EN);
> >>>> +	writel(0x10, qmp->dp_tx2 + QSERDES_V2_TX_HIGHZ_DRVR_EN);
> >>>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V2_TX_TX_POL_INV);
> >>> Are you sure that these don't need to be adjusted based on
> >>> qmp->orientation or selected lanes count?
> >>>
> >>> In fact... I don't see orientation handling for DP at all. Don't we need
> >>> it?
> >>
> >> Thanks for the review.
> >>
> >> I agree with your reasoning and compared talos 14nm HPG with hana/kona
> >> 7nm PHY HPG; the 7nm COMBO PHY series has orientation/lane-count dependent
> >> configs, but the 14nm PHY series does not. On QCS615 (talos), the TX_*
> >> registers you pointed to are programmed with constant values regardless
> >> of orientation or lane count. This has been confirmed from both the HPG
> >> and the downstream reference driver.
> > Thanks for the confirmation.
> >
> >> For orientation, from reference the only difference is DP_PHY_MODE, which
> >> is set by qmp_usbc_configure_dp_mode(). The DP PHY does have an
> >> SW_PORTSELECT-related register, but due to talos lane mapping from the
> >> DP controller to the PHY not being the standard <0 1 2 3> sequence, it
> >> cannot reliably handle orientation flip. Also, QCS615 is a fixed-
> >> orientation platform (not DP-over-TypeC), so there is no validated hardware
> >> path for orientation flip on this platform.
> > Wait... I thought that the the non-standard lane order is handled by the
> > DP driver, then we should be able to handle the orientation inside PHY
> > driver as usual.
> 
> 
> Yes, I have confirmed this with our verification team.
> 
> For the non-standard lane order, handling flip requires swapping mapped 
> lane 0 ↔ lane 3 and lane 1 ↔ lane 2 in the logical2physical mapping.
> This is a hardware limitation, and with the current PHY driver we cannot
> propagate orientation status to dp_ctrl for processing.

This might mean that we might need to make DP host receive mux
messages...

> 
> 
> > Anyway, please add a FIXME comment into the source file and a note to
> > the commit message that SW_PORTSELECT should be handled, but it's not a
> > part of this patch for the stated reasons.
> 
> 
> OK, I will add a |FIXME| comment in |qmp_usbc_dp_power_on| and update the
> related commit message.

Thanks!

-- 
With best wishes
Dmitry
