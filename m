Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D3C5B5DE
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 06:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3010E9A8;
	Fri, 14 Nov 2025 05:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oeh7SY9L";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdPU6lII";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8508110E221
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 05:10:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMb5L71699799
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 05:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=44Ob5C/eoxZ2Iu9/axNE0sTh
 pLfy1097Mev4yzWFqq8=; b=Oeh7SY9LSjsB4E/J3e8aul8Ycz0iFAxs2afaa9I3
 3u2vK7s3FFheMWDDA5uCsQbLwSlNms6AkfpQ0A4jfiGQhtVU8WntONIcNdddbcja
 90chCVTHblcoE4B7lPygos6TOItlu/aX7qnnke0j4ZC2CPP1MH/Rrk5zoiMNtsnQ
 NkFv68mkDgh8zCDUkPowk6H9XbeLRQZEKx+BSdElk0SHZ42sobTGgrfbO5D+D20S
 4YPw9ycwcRMrQPK0QJ9cTnXC0Cn2416s172TsE3JwUcC3+zD/sdhaVYadt0SpHlG
 +ZI2UhnrkmmdCdq433zb/QsGJ5/GcLPe138YklXbAFU6fQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e0wq7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 05:10:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b234bae2a7so511280385a.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 21:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763097044; x=1763701844;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=44Ob5C/eoxZ2Iu9/axNE0sThpLfy1097Mev4yzWFqq8=;
 b=fdPU6lIII2GzsvXk5u2P1RdsdswM//HJb9uLgZx59krEgHrx4ERUn3X2UDX/DY8OZo
 RaI3sGSF7wObTjIcF5rWkg8HQLu49Y/6BP5ayX0zs79mT8pC1/hJyPPGdOxVszvHvjPW
 iGK4NuSRUIoKmU9Ol9OUVR6wRlYRqIUJz+XtqnqNBERE2izwelH0XMZ/+l6IzhfbuS1S
 iR7KUulgD6SGb08tKVaSbUHL85tgqhuvfxF9Pm1ln1bWyBoKYSOkpQ/DswvG4ZIChLrq
 2GN98CDMTdt/ZbrJAXkIpiS59oWEe3UerOE/bujWag9cScbI5E3lcoR8J4BCPM94VkhM
 g1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763097044; x=1763701844;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44Ob5C/eoxZ2Iu9/axNE0sThpLfy1097Mev4yzWFqq8=;
 b=EDHKNn121kpthJXNNYrkAvWfADOmigWPyBN7dr55ZTI9PjNDZvTMnQs3qoZ/3fj3X4
 niNLO4nMSFdbHe22AcQj6zIe6ST54wwsdQ8RP7n46CtEzdvnlHRxYj4m/v6QnPOLHp6w
 BdZoBS8mSQbH+MWYOBVQ91kcZUJFr2a9B95O+P/gWVJL/fYiPATR4ENnTuAOIaNVoI3R
 eB6nfHnkg/yaZF8lQ8ZyrfRotaAqsXhHMPZz89F/Z9DgCGeQpjF5Mj/4H7+BFtCLBqT7
 lnPR0am7tBHXtF3NBR8CBzitS6vGAE8i2NffsSCqgsn+ExFm3KgkM3ZTj41WRbHc/5OZ
 jTeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8zHASsvuWL8euxwlqywTr9og7w4Wpk8wPg2CZvN9oL6wifSrnVvLSm23NKfBO+GhN1YjD7K8RbsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzokcE11gSX27yTgVtVvsno2C/c5nHfG3U6qH+VqAxGDt4BAMut
 LI5u0CBUYD7Mryyorn368KgYb3UHrbRk55+ludKrtfBBywYdl/L47yJh+DAYFtuxGCUL8+H0AYD
 1ypevNWsfIwLAPcF3yFlCO61u2/ImVY3CRqDHjirmh1szvpHaIwKEfZ+/KEW4OrauSyopqYU=
X-Gm-Gg: ASbGncuN5mDfWm8M+5iv1DVhYb/r6A9W6Uc2/MsxCA2x2q2j7sbWbT04dj3uvH4xz6+
 vTiPBu4/XoSXx2HbOXL2TyRn/zqynPexrxJlzq/z2v9JDCbfXp0qLhr7M4iaOFslmoZ20IHlttt
 Y8XvFu70U0/l7g7D35FQzihhq2aeHDWM4Iw58wgANP+qikrmZqBEfE/COVMi2Mfqli9XAfb9M5p
 /V3RGpbtUEC3JqPIEW4a/oNQsenSaQ/NLgDbK6+r8z+y7oR041gzzGjXJNBW3iBtE9X5GiBr6VC
 N2ZFpO01oNOZWy3BgLf++e2VmVNOUEMSnTTyx6iaXfmxxxwIh+XLHaar9ExIK+CGiKcobQhg/HR
 6vyjATSqcAEn/RvhrqFn+I6gHGc6JEVIcRgysiKZP44NzLB9Ayp0REoYfwyzEVvqJOW48rUqhb4
 Et1DbqIKMX54wZ
X-Received: by 2002:ac8:7d49:0:b0:4d8:afdb:1264 with SMTP id
 d75a77b69052e-4edf20e9f4bmr34512201cf.51.1763097043800; 
 Thu, 13 Nov 2025 21:10:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6GjIlXHWYQldrxdWCXMS1QKmAQg9PVKQ1at1juGVNtZz0+QnY0nul8zlaGm4YiXDNCleLcQ==
X-Received: by 2002:ac8:7d49:0:b0:4d8:afdb:1264 with SMTP id
 d75a77b69052e-4edf20e9f4bmr34511941cf.51.1763097043256; 
 Thu, 13 Nov 2025 21:10:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b9ee0sm818641e87.50.2025.11.13.21.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 21:10:41 -0800 (PST)
Date: Fri, 14 Nov 2025 07:10:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <5gtcpea2cqjyagoy7ielhauetcqoo4b4dkfilma2drujn32oh6@gyaahiusmwfv>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
 <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wF7g5jnlq7jlkXS3eATEH3a40SIh7DYQ
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=6916b9d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RxLA63kN50J1D6vl5DIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wF7g5jnlq7jlkXS3eATEH3a40SIh7DYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAzOCBTYWx0ZWRfX/qJ3W60A6AR7
 /XczKwHAcCWjB5hpyab0vQP1c1ouskV/KZ6e1eTnEdb2ZXb1tGTV19q1mqeI+NU/xE0yKdZ+6IP
 MrNfGme7NpcxGcEG2W5f0QnuARX3t8segywsY6OHmqzuBYijxPUPPwxQtW90oqJ3+9n7LlnxKN8
 UoEpyZA2Pd+97jngwXOpHZq5vpwPXUm/CjcLcxZ+mXcdje6KOp95O28s98XivA/tSLPl+SeHQ//
 tVw9BNaVvWWMr4nuVu5DOHwspXVjUO3WfOdaTBch9KtkoFvQzIkPqAUOGOFXYElThOrYRA1gjT5
 TdWDQyu8RMkSxG7o1fXfUdsureNgsmzl261k7KWNJq5uRqg9AscssP3c0sYznsDSdmtA7HiPT0n
 G9Xx/a6RXUH1tVo9eAj2ESXZomS/Sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140038
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

On Thu, Oct 09, 2025 at 03:06:55PM -0700, Mahesh Bharadwaj Kannan wrote:
> On 10/9/2025 1:09 PM, Christophe JAILLET wrote:
> 
> > 'mixer' is only zeroed and is not use. Remove it.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
> >   1 file changed, 3 deletions(-)
> 
> Acked-By: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>

WARNING: 'Acked-by:' is the preferred signature form

-- 
With best wishes
Dmitry
