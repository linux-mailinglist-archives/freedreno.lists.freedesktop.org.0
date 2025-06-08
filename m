Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7261AD12EF
	for <lists+freedreno@lfdr.de>; Sun,  8 Jun 2025 17:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BA410E103;
	Sun,  8 Jun 2025 15:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pz6uu8ru";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0D710E103
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jun 2025 15:21:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558D8lal027988
 for <freedreno@lists.freedesktop.org>; Sun, 8 Jun 2025 15:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=; b=Pz
 6uu8ruZbbxQJBWUXgV7JoCc7DBOj9QCBE60RwlPOXfeA8Xxzc7Ffhwn92PGbcJaa
 DVAdP+4/zh0K33sE2OxLMn5Iwq8JuQS9jKtDCZDUe3KJXC5cObD13UyoKb70iBmo
 AAgLje+TV0Z9b/VYYs8oa9oa9KGoFrwxndeTr0Z6DfL3TXfeFVLQoE040kMgzbXR
 1njLB2t1KIfGbeBTXdyaktZuc4qggx61LgIJHhlST3b29aqKO7xvsJqvJkThSIJT
 uj6saz0zK4/2pPa8Nx3ARz2hCjM6+khqfnJt+yJPnm/0wrNwbUrJuUa8SaGTFdne
 tpfmjWkvzake6hBeU68Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcayhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jun 2025 15:21:46 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-2e91916a983so1374384fac.2
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jun 2025 08:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749396105; x=1750000905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=;
 b=SrEiFLc3icG1Ah190Wb8j9cwVAiFzV6vnExg1XhgnGphbtV/dBZPuHoU4CaAquGQjQ
 1RfGy1d6Kjhb8alWVacPEW9X5WPM6NfY+qZA5ZdvElDmIepEDRzFh1oKOeIPjDoFUOIu
 iT9qMx/Vz6j6ZDD/42pY9fPkWDeemsoUFO0jc3n83hjrszLVPSBUuz8LptNzmbJXqvX/
 0Ktng+rmTNi6c0Mvrn4U4auMtlb3AhgMRLJ7xZvoJrnRJCtqrm+1IE62Ly5rE0fA3Cdu
 EuozyI0BCu3oivKWn2ng1F+B5OZ7UMwaiBIFA6MGLXBkrMo6iQA5aVVoPOooboPBfo+y
 eEfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6qPfNMaf8Fs9d+VRxeukjbqvvm88PULqIBCoNNiUS5RdBK+UCVAFfCDncQ16Ik5J/9wP2YTFOEnU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx38bB/gVY/09gcfqFdwpw39sv/0XFyKogM8qmgpsPUQ/nSjOf
 fdwYZuIx5lweS3xzthHupRKxtsCGWA10WfMXXd3nEJV8mOF/LIYl9Bs6FtR0JeQhURIAekG72JE
 uAgGJdMLRU0nHxYqxHIcSuv0C4HJCKiRoarq9tOiKACNRopreeqjnwNppmOgw1KIdcCqaPLcdIs
 SrejUBpU6ncZkTyb2cY5N3me+D+RU188KBVmtJEnF3tQXGXw==
X-Gm-Gg: ASbGncvmAvldH7vpgLWKyPWOHThTH8+wegZt++m8CdZdyIqNM3Oc5mKTulK64pnJihE
 vOY/9cioRUMR5qlCGa/vx/0OIzcDDTnel0+oEaNBknF4Hclzk75sre5GhYdZEngNepmI8yZZR5p
 tMlVyuRC+qYVVy8gMuFwaIMhRgwLcdXLEXOw0=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id
 586e51a60fabf-2ea007a9e74mr5430087fac.7.1749396105518; 
 Sun, 08 Jun 2025 08:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeiwEJ5iaDlOgKPAjvzclsMxV+Ve51cmb4U8YPN6w25l7BtGOQgh5AvGBbsmLKSAPaB7+VQf5sDKWINoqBQY8=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id
 586e51a60fabf-2ea007a9e74mr5430084fac.7.1749396105225; Sun, 08 Jun 2025
 08:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 08:21:33 -0700
X-Gm-Features: AX0GCFulliz7op4BWmvcmnZlyStVB3chNWH7TufZIrZInNo_JnqWpgSQFphHTQk
Message-ID: <CACSVV01A8aqyoM4KYuUYVXTHnM1egn5-4UxqPrQVVjuvxxbC6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMiBTYWx0ZWRfX+bMM+7QObLES
 1XiF+Fy9kp60gD6gW5htC2NPH9OCczj/qVNDljgss7oEJiWtNcw3fiGOQjsS0hWmiLHnHmpIoBO
 UHWW6us9H6EDF8DwqrwAVUM0AW8+MYirAvGQv4aZTfM/e/756VJpEO5z9U+5kg9JryQtixXnbKF
 K37785qyUqZQySxMc98d601GKJFs0qOiqKepbCaZL0hMWBzLE70kcgYxG0O3AgW2SQXDQO8VNUs
 lvN7MFFp58t5SJr/ZGjybZAc2pI8moM1tsvtDyp/t+O/aJ+2AvfjfYeVO8xrz4pLOlO23IrYAH7
 ytoTSXU4AoPg+R2daHHc68C9d1PKR2JMBg4UEd46h2EgyD55DuNPB/HD54314lAFN/m//T8zkSa
 t9NpebAYpi8V/yT8pbigotFAULQ7FjiFu6LYW5jiPIIdqpOLMWOEAsAFoFApNNoq/isWBT/C
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6845aa8a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=MXl9TKsJXw4pWBb3H3sA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: PuuQghAefSFM9F9azCVLHDO6PdCVmmLY
X-Proofpoint-ORIG-GUID: PuuQghAefSFM9F9azCVLHDO6PdCVmmLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=679
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080122
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

On Sat, Jun 7, 2025 at 7:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
> Tested Glmark & Vkmark on Debian Gnome desktop.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

fyi, mesa part: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3=
5404

BR,
-R

> ---
> Akhil P Oommen (3):
>       arm64: defconfig: Enable X1P42100_GPUCC driver
>       drm/msm/adreno: Add Adreno X1-45 support
>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
>
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++++++++++=
+++++-
>  arch/arm64/configs/defconfig              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250603-x1p-adreno-219da2fd4ca4
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
