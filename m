Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E03ABE53A
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 22:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AC110E5EF;
	Tue, 20 May 2025 20:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8gLY0Z8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4478310E5BD
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:56:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdjKt024573
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=CP4xwurVbbToqKBRo2zAIG/y
 iqGnKWmP98PPEkImYEE=; b=U8gLY0Z8pR5SFnPRgOjKJG6Alyhq4VbwJO95rW7J
 9EZUy95ri/k7bsd9dfcod+7FpQktOdUAklg4vu6RAJzeI1P9KU1OAdags0FkzuLi
 pfPDWzJnIDUX9ke3CzgUii7CsDl9NyzJ/m4P7XF3roPeGYz1pTDYCm3TmjRQqeqf
 wTdR7F5qXyHs9Q30cYICSgRFPjBHM8DDDOP+ZALi9kezflkhdeid5Kp3XjeVIiRT
 kXamh1VaHWpa7KVbuarFOpuPeCKKUiAEGREH9iX28NXNwZ5sEkTfd4L7Zo1dcq1c
 ZH08EhLR1iHY5kMrqQjOr4PeBLBllKR4t7aZ4T6m6hWn8g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf30kv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:56:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8e23d6657so32866546d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 13:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747774596; x=1748379396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CP4xwurVbbToqKBRo2zAIG/yiqGnKWmP98PPEkImYEE=;
 b=iF+vzeFxfH6pOLMlklUikEOHYCNsWLCGyzo3gFZ4oeCWcGV088XCfmZ8d6SDbB87kZ
 5H7I6yUiyXDZwQq72ogNMh2uELh9G0x0TJDJyoPWL/78X0YoIP76+x0MJ1GnFtsn3eiA
 l6N0tzZxT9LDf0HuoP0rZYQfDONHIA8xwoTV740WojgaBfAZV5c1pVNwORkWDyB/TjAX
 m6Xd7Qj7wMymzugLW8w+05rRTzD0gu+oFoNm/CeHhHjNmIJK4v0bUJAVHtRgXFT8snYO
 n425ajsyb1ElN3QQny4L6ObbqcLkmKJCVgCb4LWpzFcXcvRgDZrSs688Xi8xGmF9mu6q
 GB/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/PkIVcHMCXfmffdwAgIPpkRPwP/GTFqcYo5gtgPgNfG248wbRRf0Z1AAkH2+f1uNOsN9jgZ51KMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFOjYdtlPytuVH4Baq8zPdYfbjN6OxCNoKIvNYExDhNxyADJYS
 IY45L5R3Opjt4FzjNqFkwsdAhwe/rJh5FfOiP8mgTqWRAw/Pgip2A7hoI/9fNWDCKgX+v2/6Ey/
 YHDOFuTL/PNvVEu+hyrcMqPPZbR4ZKmnur8YzAEcKap1gx4CbFyRyfGErYqZtRR/4APC8kqY=
X-Gm-Gg: ASbGncvovU2sHeSdzTa1NyfwB9OZLTiEV7ITJjUq5zfmm3idCUx8XxIdJojGT5eS19I
 qWCUrnstxll6ETS2K7xcU50xTVhOAUD9AFbFgYHYbxs0q3OFYEO8DBEQVK8dLcsM1rbLwdiivAG
 U6oqO4+PsysZq1dDVxpdZSUTueJLuYEmxlgqu/cs1UEitdVpx7Un1OCSGnQHqavChy7tSm6SLYv
 qfvwQMtG8D0fxMzHpFxT8SacvNIG0Av9l0HvbqFjtbiNVfy/SueKwG179bhv/CEnb3meo76uYCU
 N3XLnFjDfGWRk1S3xkGOhrq7FyGv+2noNpGcyVoBe5reksRsXgaKeIEs52rv5QDeAMGUuZfak7w
 =
X-Received: by 2002:ad4:5f8e:0:b0:6f8:9b75:a62f with SMTP id
 6a1803df08f44-6f8b086659cmr266190086d6.24.1747774596248; 
 Tue, 20 May 2025 13:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFy83aHJuT/E6OBhfe1n52CIbQyDvRG65Dk2H4hxXroNmeP8X+zaXZZgMd9JBrOkilPmPJ4w==
X-Received: by 2002:ad4:5f8e:0:b0:6f8:9b75:a62f with SMTP id
 6a1803df08f44-6f8b086659cmr266189796d6.24.1747774595898; 
 Tue, 20 May 2025 13:56:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702c0e6sm2479511e87.161.2025.05.20.13.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:56:35 -0700 (PDT)
Date: Tue, 20 May 2025 23:56:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v4 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <vfl5autirf6a7fg3ck55xh26rx3nbfkl7cq3kthwmffsfhdc5b@r6ibkyn2n6nq>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
 <20250520-topic-ubwc_central-v4-4-2a461d32234a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-topic-ubwc_central-v4-4-2a461d32234a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -jkf_8Jg9q5hC_F_A3tH-xTmTYXe5dU0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MCBTYWx0ZWRfX2DSkKl7rbTqg
 paLEGcDS5tkF1k52vMJf6gdCn8iahT4gYoTFTyRMaGKu4ur4IQ9DX1ke3gtZIXYFFgcoQdkrSLE
 KybilhrKZ2DV1k/n5DjLHEDbpQabAMJaZqsdjoMiTuAeR+YOfWyG9Y7BJbejWm94bOkcbq/kXei
 6sb2EH5Arax6IQwoDU93wtlNiJV1kkKfBL600AZjc+uZHAZ3eLN/03E0InrHqCSNfaz+BhsM8MC
 ygljwSm9z3XiVbQBYTxnGtBeEni50Uah0urjOAncu2DdjKJJEfVM6LUZO+LX0740/O/pzJe139r
 1UwTPLUCnMazCmboFstmizQlLAcZQwkgJJNPYhPNBC30CPv1S71ZIOgdPmB3rJ00KtAoZdk/I7v
 KNLuApwRPzEpSoU953b0GfJbM9IacplWspkztro538ecapqy5EK8Ovs169Ae2F8mpkMRymW1
X-Proofpoint-GUID: -jkf_8Jg9q5hC_F_A3tH-xTmTYXe5dU0
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682cec85 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=93Yf4Y-vqGi4v4eIoEMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=815 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200170
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

On Tue, May 20, 2025 at 01:07:09PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Start the great despaghettification by getting a pointer to the common
> UBWC configuration, which houses e.g. UBWC versions that we need to
> make decisions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
