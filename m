Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20FC066ED
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 15:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0882A10EA7E;
	Fri, 24 Oct 2025 13:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibzR3Eme";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297F010EA7E
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 13:16:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCS92Q003822
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 13:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=byOciELpl5Z6xs5F1BjoX7m6FGuSIderWS7y2wVyB/I=; b=ib
 zR3Emew2haVfNCIxDbAhctoCb8qYx040joStYMcC9bNoRWVP0qbUQ/jo5f4b33yy
 6fRO29Gtc39bZhSx7IzyCsNpfACWGt2QDB98AMIWpuK1ufR1Rk7tLqRfoIlpIuwr
 6J0OcbtD2wvRmcb1VKee+8kEBp9XxKbyTJG/SUdxA1n9NWMImykuJvj5nRsT9YlX
 Y5EjzNdKGN0z8/K7ADOIDY01kUtlLIpfktdBFnODp8FmBUw2b0lTUa+uQ8+ItcBQ
 PpEIYphQjND7VEW3py2CMDdG84F0eVsxNT9mF/1ack+2iI5EBwoBqkIW6ehcE8e+
 PlX4GYmJGassNEiT0THQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jc0mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 13:16:16 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7c272f23854so3439363a34.2
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761311775; x=1761916575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=byOciELpl5Z6xs5F1BjoX7m6FGuSIderWS7y2wVyB/I=;
 b=XoWcXhw3NgaH4nvCn5sPfHzCqkTFk/1T/1t3K9aJF2r2FIZQHZ/MW7ilqIpGqjBRlW
 YNRkBiWxRtiW7DWouwxAOLBa13LpdmY5nLP6mUSdSaFEOeXzn0OWeqhqOlni0HcKDpY2
 AsJ6DL0uvB61S7IT0eTAjSqiiO8TBTJc+Tl3rVyZkDIyflS2/JsZNfHyUlzChHmtjsDI
 ME8OXqWz+jY7O6vcuReFGui9TXb16N/IT12WkD/XXsGI16a3Fa7cjxbezX7WABKOIF2Y
 6emgaS1euzdcqpwRI9v2qLzApU1K8XrLK0oJOCs5hY+k3tIKDJOz/iUovxw+2JeSWFmg
 vM2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8N4P0VFpL05jJNfHGsN0FZLDWp1jvHGXIdfhzIWmpp6g2pdmJKZg4TjrnIqBd9J7nL9NB2Y2Zn14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiR/Hef8lP2GmCt1k1tmMIyh+bWOeqCQJwu+ScSROS3oEVE9tL
 KXEumZyjQVSETDGg+sTgfRdRtWp4ATBbvtwzhGi+5W+Qi7VqeNCZt0AzrxFJP8EF7/NsVceSlxa
 mPw/IppdIgv66sLxPsyrKl/PF4hFyoJZOX9HEqFiSLE9rOnklWIWzDQq1jAoI+Flvt2++gHMcFz
 7W2RP7L4SxuWm4UijSiRTAP1gwafj1cEPmRgknEkWmxBaiMg==
X-Gm-Gg: ASbGncuvpPSkPZw2Wpr2pxkkaBPgnai1NjI8EFUClKqc/jsgLhGhvu8I0/61CUIjAJB
 POBFY8pAPOpB6FRw/PEVDo52y+AdcGiRaVqN2uVVW3O85FidZxXGwzBlK9CMiO5ajkZRg+qd50L
 97QtCqc1H2VhaevUNBo59tmYhrYMJ8EBC/F4RJ1gcmYWAg/yz4wxV96Du58xSqkfrSiSax6NE0E
 Wr4Jvr4AxkNWUc=
X-Received: by 2002:a05:6808:1a10:b0:438:2907:2eb2 with SMTP id
 5614622812f47-443a2f1bd6amr12854283b6e.27.1761311775051; 
 Fri, 24 Oct 2025 06:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2CISebn1N5xd4PZByUVLyDXrr/11eYjZ+6T+XeX31Sqh8BXVvKthtYMmCCNr6jM2tfm7vhWAcoEANgO9/pjY=
X-Received: by 2002:a05:6808:1a10:b0:438:2907:2eb2 with SMTP id
 5614622812f47-443a2f1bd6amr12854248b6e.27.1761311774411; Fri, 24 Oct 2025
 06:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-1-0baa44f80905@oss.qualcomm.com>
 <44ff81bf-8970-475c-a4f5-c03220bc8c3f@oss.qualcomm.com>
 <97aeb6a1-fda2-440f-b14b-2f3dbc2d7e8e@oss.qualcomm.com>
 <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
In-Reply-To: <5e64c246-a424-42c9-b102-e1a2af579936@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 06:16:03 -0700
X-Gm-Features: AWmQ_bn61rL8UkwSaP9vHSdM_zlnxFNoNmPvQunQe3sK6AVw6dJjnNBmKMTrbrw
Message-ID: <CACSVV00vwbNtH47S_BVet7uP7u9t4RY=xTBn_r3u4sS91Y7Muw@mail.gmail.com>
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX4k/VNpdVy/LQ
 TTk1+JbukGfqg3RWrLBct14MznfCVGA6WUuOMb+1LGhqy8G6gQGVUxEXsos2OPBXLJhWpCHhUdW
 yGlIIhjRXOej3Sx2J/HE6UVdo+mNrICCUxIK2KnUKJVmwCapIVdSu/YwQ8aYhwb/qSlnmUuvJ6g
 lQApVTofLy7dSG6Ez79BwLdCrwaNovj+JaeO9Vxb1hph9Z9oWYGVfIY7Dza7axFqIkP+HOpnxlk
 PH17rfmUrU8SqqRp9WpB4YoJk08IryJYNuCm2RJni+c2A75lEYMLcv2tQ2sdeksw+C5B35+Tfis
 gIhg6ja64ZgtQBqJFsmt+GMs0fFr5TKxxPGUge9Z7JEA1dsJH6eSTrNRrjW9G74LjKEJ0EWvqu1
 xn50t1zQKh+bbmkQDwybnkI4J5dk/A==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fb7c20 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=gM72ra8ASCPjNpuaUpAA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hacRVWK-Cg2M2vXDC0MCvhSFaavEPZGX
X-Proofpoint-ORIG-GUID: hacRVWK-Cg2M2vXDC0MCvhSFaavEPZGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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

On Fri, Oct 24, 2025 at 12:55=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/24/25 12:57 AM, Akhil P Oommen wrote:
> > On 10/22/2025 8:43 PM, Konrad Dybcio wrote:
> >> On 10/17/25 7:08 PM, Akhil P Oommen wrote:
> >>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>
> >>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
> >>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
> >>> of A615 GPU.
> >>>
> >>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
> >>> which is a small state machine which helps to toggle GX GDSC
> >>> (connected to CX rail) to implement IFPC feature. It doesn't support
> >>> any other features of a full fledged GMU like clock control, resource
> >>> voting to rpmh etc. So we need linux clock driver support like other
> >>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc=
.
> >>> This patch skips RGMU core initialization and act more like a
> >>> gmu-wrapper case.
> >>>
> >>> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> @@ -350,12 +350,18 @@ static const struct a6xx_gmu_oob_bits a6xx_gmu_=
oob_bits[] =3D {
> >>>  /* Trigger a OOB (out of band) request to the GMU */
> >>>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state s=
tate)
> >>>  {
> >>> +   struct a6xx_gpu *a6xx_gpu =3D container_of(gmu, struct a6xx_gpu, =
gmu);
> >>> +   struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> >>>     int ret;
> >>>     u32 val;
> >>>     int request, ack;
> >>>
> >>>     WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
> >>>
> >>> +   /* Skip OOB calls since RGMU is not enabled */
> >>
> >> "RGMU doesn't handle OOB calls"
> >
> > Technically RGMU can handle OOB calls. But we are not initializing rgmu=
.
>
> Oh, I glossed over that..
>
> IIRC the reason we delayed 612 support in the past was to make sure
> that the RGMU FW is consumed, so that runtime requirements don't
> suddenly change one day.
>
> If you have no interest/way in getting it wholly supported right now,
> can you at least make sure that the driver requests the firmware and
> exits if it's absent?

adreno_load_gpu() calls adreno_load_fw() first thing, and will bail if
gmu fw is missing.  (zap fw is a bit more awkward since that could
come from dt or device table.)

BR,
-R
