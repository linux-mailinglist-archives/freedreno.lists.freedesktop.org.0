Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F123AB750B
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB0C10E638;
	Wed, 14 May 2025 19:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNdq2vHP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7F510E638
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:04:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAvAnq016166
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aPZSuuY1W/lCvYUJRt7cqKLa
 wbwX8uiQ1760f2RdC0w=; b=GNdq2vHPVhfWAK6PbeUHRHsKrtZBokiSj1Nab4rk
 5Ozx0/lcH9cJtLSQ1MdsbKEQMwLdK4bECGNjR1LPwlmPWUZTvAav+UGyJrv5yXeF
 M9XWiaG11phSC6ApxL0u6sS5JcfFsh78mtjDUGGhDIRcIy9hA3BJIYqzTeyLTwMi
 BF9Aoo8Xr31a9ZsnvT+jZrOcqeovKOKv1LDK7KkUCCbcoRZpHIgdLdU64zuZCpHh
 UZPp0nqaTy+VumjBxJE7W6jE1j4g5f173hjVJ+R3rCXIzhhGI18iOjCQQZI1N2uF
 gyrXXTBcvjLdL2qFClDTARQXmbNMWZykHg82Gsua1hCqRA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmuv90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:04:13 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3d93e2ac7fbso2868705ab.1
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747249452; x=1747854252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPZSuuY1W/lCvYUJRt7cqKLawbwX8uiQ1760f2RdC0w=;
 b=CRwqtbRICxJ3wn1YHucySbQ2oWwjgxxLF0shJN6OYoxz0IEWEiptYvVHLvpFDOomkl
 1NeGX7OBNDgOkxlPNRoCfOw74zzje9G7NLTCYGKwyGapj/yM84Gq7BCupr5wVGl5illC
 dnhgyw2TMKNncsoV21XGJtaan2Iu77J9YcrMW+TdXoBO51ctvatkOQzOmab2YXw8Y1r9
 nGGjfLDInTBYA+TwNEpBHjxYOLGvaynuILTR+1XvwFxjxP2d/vdlcJotWMIN2IoHFl3L
 ymcNR1jHRsSE04giAS63U0M1lApkBpDlWr9gd8SwJJnbM4bBXQaF8QdmJUpqM73oaoSz
 YRaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYYtS87Ild3/JVzJcg6csJd+2eAwJ5KfUQcgoJVjkZxXOHyRiGOw6zMlfkWsxaXansVtiE/rE3q1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxny6cMVJFnxibCBkHG1hW1afyyPkoWhw3xyVFn59l7qtYn/ZEg
 OMU8Fe8GynreKrJCOSVdkKfrUQJ+P9z9JKoFesqo/CkxJQ6+1nj5k+Q3LYIkCWgxyvcoAnZ3CdA
 xHwOkgDeVD2+AZywiqpYNRYi15qM56KEQ0fS1DIVW947VeULJrE/FzX/dGDBNkxDZvPw=
X-Gm-Gg: ASbGncsyB/eLV7B9MFylP84+gyfuatTR5iGIsoFikQU6Mnflt5cKoTSBQVy3QJtC7U9
 DYeYnmnvxPU05YsQ23HinTDxOtFC6qngLZUKPUt0z+v1AsfVBp/29KZ2o1VYz1vsCwNmOCp/Vjj
 lSjlSGSS4n1DXjfL5tta9FKPbzqDk/C88zHjfx3D0d6sCvpckuWRDr/26R2GAyLWGuDzTFWSJIJ
 eJmGxVJovGV+4PY1G6ABfK6Bo3jZ9bEyWu+gLTRUyn5pdNsmr0k9n+VY5/0m4d3L37+Q4YdZbob
 VnxlPauon17YIh8zqr6TWc1a/Hl7tAp8nEVfWIrJgsTibUAlb6MDSGWVK6ANpLg5CWPa4vkGUSA
 =
X-Received: by 2002:a92:ca09:0:b0:3d9:3a09:415e with SMTP id
 e9e14a558f8ab-3db6f7f8816mr51919455ab.19.1747249452366; 
 Wed, 14 May 2025 12:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1XZOwFPXRq4qN4nQf+1LdGLzvGFgQT2vfouD5tcjh/PXEkQ7Sf0nUxsz+NzWLL1xiMHL/tQ==
X-Received: by 2002:a92:ca09:0:b0:3d9:3a09:415e with SMTP id
 e9e14a558f8ab-3db6f7f8816mr51919015ab.19.1747249451992; 
 Wed, 14 May 2025 12:04:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64d07d8sm2362836e87.257.2025.05.14.12.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:04:11 -0700 (PDT)
Date: Wed, 14 May 2025 22:04:09 +0300
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
Subject: Re: [PATCH RFT v2 02/15] drm/msm: Offset MDSS HBB value by 13
Message-ID: <zrz32vlzyozool76prwmwtz3us27dubfscpdtxjoydr7jps7tq@awla4zpep7kk>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-2-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-2-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: g8gqADZveqo8gfj7SCx_I9s6sLdcJE9T
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824e92d cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JTEDtJd_13X3dLxXeFUA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-GUID: g8gqADZveqo8gfj7SCx_I9s6sLdcJE9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX0ZKi4PSSolev
 wvTjnfPHRQFQNg+DXoMgPdkAZwm7XxOP0Dn/01a7nqXIgKIBiTx2fc1qWF09aGYa799gvo8LIyo
 Q67Fmi/gsVpLQIuWX2Y2qnJXzObAwInJe7tz9KKu/0mEzWhzESlLGMgW/i+sPoTh8nLmeBqdG/k
 RO/OCx1gzEpccc+GMqOBlmgcBPgHHZgkJOy9erRBadhl2A3JjiPH5qKzJB8DjgOhK/7/4cgrOWX
 kMFQfY+U1LHSy+FoD5CdfBgQ62WClSiA6SWBpHCmfPBPgVlDlg55DLJJV469Kcps+5DhmIk5Uo9
 Jeg6zRuiNIHS7jmBZFsYK2Q5vZ4sZRMxjkfYoMn5Ezd5nVZG88evApwCDfXGD6Vs7ygD4oNp0Lj
 +PG+ARBE4BV0FVmwn2NjIv8XO7xFY7ihDt+V2nAUUBr6IvdehuNPCXoE734EDKr84c2k4EkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=781 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140173
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

On Wed, May 14, 2025 at 05:10:22PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Adreno part of the driver exposes this value to userspace, and the
> SMEM data source also presents a x+13 value. Keep things coherent and
> make the value uniform across them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 50 +++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
