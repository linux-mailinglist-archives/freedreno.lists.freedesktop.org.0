Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B1AD9E01
	for <lists+freedreno@lfdr.de>; Sat, 14 Jun 2025 17:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFFF10E00B;
	Sat, 14 Jun 2025 15:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1ul7Tvv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3127C10E00B
 for <freedreno@lists.freedesktop.org>; Sat, 14 Jun 2025 15:15:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E7sHKp032547
 for <freedreno@lists.freedesktop.org>; Sat, 14 Jun 2025 15:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=d8pysWykzzp5ZSa8D/f7idklhSx+zwqym/FK5UgUh5U=; b=Q1
 ul7Tvvci9pwDP6eqpn0ZWDcQi81QcBBQjKEnCFPg42/fjAQC01+JsgFmESWvMVTH
 OQyzUQFc72gTAmdMvF18jlqocvbFA7YpHHajMeDOqcRjsw+Un0wJlIU4WyVfYFak
 pjM5wqnMzrWp1hPdO7ruHtz+bCnJ/ic/2fd0um7+Yn3ZBmQY8VLmaRwKBsFUx9Uk
 cyIOq3gYuXCreiqThbw86zsqmehfEq0uPuSVfYqlDa9dnH/urjoJRnXydKAoNW7F
 1eHfEgcd1Mkw59nDfB9c3hkggDSFb427VZbi+NMRXKzq/f9K8G8s19vsZBNkBPrT
 l4HykaVbpkw+Nl94d2MQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crgpcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 14 Jun 2025 15:15:51 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-4066ff1aab8so2956132b6e.2
 for <freedreno@lists.freedesktop.org>; Sat, 14 Jun 2025 08:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749914150; x=1750518950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d8pysWykzzp5ZSa8D/f7idklhSx+zwqym/FK5UgUh5U=;
 b=kkMtfgcfBGuCPe42xRoNTD0gn+Bj8V2gAcytEQnm7XLEGe8RhbKS1G+Cc0sB8idPr9
 XcNeBEek3XIQh4reN28Zc/GseT+EJ+Rs2NJuYxbXUnd3iAIWNSkdr/nbQRkPPwgx6ZcW
 cFXmT14AXspkJZmHdSPa2iluvlvl9D/8awc4QgZyizpqjYW18NT4O+RF5UTUnq9MapyY
 a3M2Wz4apaZT6+p7aPeEncNDVBZQ0bwwtqTeni3ooi+hTuqs/u60OVu1rckyJ4Ts8gRm
 J/AlHOAGaokVpCVg7olo3x/FNB6U0VuYkJCK0rmfqrAbO2zQjy8PjE2tumsHcBOQ/V4N
 iG2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyrftVJjkAMeH9PTOaFLJlCnDlN/CPUw2PbnhJHUlXQ7+2ibvOKvIKuWXUsX4+m90ZrXBriKGvx24=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbzdmtAt4zrUlPjyiiz/i7roH2tkcHqrTxanX+dvzeCGuAKS1Z
 QlI8RkHMzbOFkf4c+z7+1FTNUUTQ24T4pfy2Zf/BXEzbTQzwvcfH7KZajLhNGNnItVOhzPeVzPU
 egx20/qX7PNzE2p7dTQpz+zAoaeOd3SH0e7wktsveCDItOUd08/ahf1PFbrD2Auw6QB7BxXYI26
 Q3CXz9HvV5jTQopnKGRV8JMHe9kiW9FpJQH1US18O1i8oT1A==
X-Gm-Gg: ASbGncsof9h47rcREDd7xeLU4T1M5PHR5MTANhlCbCFDbPluZssQ+Y9VG1vbJn7DKJA
 I5biRY5/TbfkPr59RGAjDI/cNZonskUoFl4qc73tWCs5uEYzjyLyPk03hhS7K+h0jzGqsHS9ahU
 p0ZY+d2zp+MDarRjGNuBPnKk/WkRnJUs22Bb0=
X-Received: by 2002:a05:6808:690b:b0:401:cae9:4dc3 with SMTP id
 5614622812f47-40a7c13a8b6mr2349827b6e.8.1749914150432; 
 Sat, 14 Jun 2025 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMbwblJsD/pMG2FwsGL3eZLj5yHznrNfIA7Pmr/sCExEn3egU7d2pTqU9/DLMoErYH02zZS3uNIJzPax6X90w=
X-Received: by 2002:a05:6808:690b:b0:401:cae9:4dc3 with SMTP id
 5614622812f47-40a7c13a8b6mr2349807b6e.8.1749914150052; Sat, 14 Jun 2025
 08:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
 <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
 <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
In-Reply-To: <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 08:15:39 -0700
X-Gm-Features: AX0GCFtPk9tPdVg_KDSrMIfi7f7qfSkV0Cof0fPtpyMc67NsnsiF1f7jX-9Eurs
Message-ID: <CACSVV03_GEuFWHPDB3gGm+Mq9uR8QJ1HabKcKVxnQjagf65v=w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: RVy9WiAC76O2ssiKyPtajesS2FknnaAE
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684d9227 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=uiBUSSwroAowxIVJ74EA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RVy9WiAC76O2ssiKyPtajesS2FknnaAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDEyOCBTYWx0ZWRfX9erOc2mgSBaw
 K+lPVbywzlEFfuezn6N4TjJi3CrVR//X7tLMrwqT4GQyU6dlEeC+d/9Q6RS0fAhnlN8IhaBsGmS
 dDramA7sGUJWoTDbGY3XwfGKBfej1YBln/oiAtYxPKnfTCDMHfM9qr0kpZtyLJ59/gCQyr8GVI2
 SYAh5PuaGprHxuxNjYnBbM6qysYR+cLOKZdEh2ljWGgVKG9kgC1gHSJ18hQDDF+E19MmnBvoAnq
 7CVhTJDnBLyjQmsrPy8RYdDGTCSYjQ6uIowiX/S/wX2pKpXuoVb3NZ3W6hSUAGvo41qxBBtdShS
 QK7eBLWVQPaYcjjO36G8SYFsrGjIAnIogYdBViOc7nrPlBAiLZmq1rjOPayHRvn1Xkv2xnH0U6E
 2ce/ZH373wJmBiZ4nqq2qZOa+gVkcvKjT5E4o/do2y0es6UBbDi99e1G7OZTPfREA7fI9hlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=722 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140128
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

On Fri, Jun 13, 2025 at 12:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/13/25 4:57 PM, Alexey Klimov wrote:
> > On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> >> We want to WARN_ON() if info is NULL.
> >>
> >> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before =
bind")
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> >
> > Apart from tag problem it is usually a good idea to add relevant people=
 in
> > c/c. Especially when you fix the reported bug.
>
> with Alexey's concerns addressed:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Oops, forgot the reported-by.. but replying with the tag on list is
enough, it will be picked up when I apply the patch

BR,
-R
