Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E67B0EF67
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E7710E138;
	Wed, 23 Jul 2025 10:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVibFs78";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047FB10E138
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:10:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9Kxnw005629
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 367qI0nz7D+7h4lGNKFfyYMcgYPJRnaZzBeo2TflJFQ=; b=cVibFs78mpAbpqKm
 uF8czhr8zLx2t4Qe27UCNjJL81V0q2OYEG1FpSQWB/bKdWqDmB4M+AE1OgetC+wv
 JHsywSzGtQ/T+n47iZ1WLol0PVw9buC1KizXkkhhJ/QqHcqaXT/VRZmcVvYG/qPM
 Qf4/jw4miQeR5x7PrdId5DJgJ2WkVr/MgKaqKmvTQMoHBdGMzYI2NRbwxn566b66
 Gb56vuMXwJUOp39PMt/ep/xobhf3JTnjOywpHv6WSYl8kKFgoKeSjGisTfhOOxAv
 93kUO9oH4QWUlgBODKksBeK0tTXDMmUWqStrGJiuw9OuPHrVZGa8JNA6ngTO7wlI
 3Y2J+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ub98r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:10:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fac0b29789so23568296d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753265456; x=1753870256;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=367qI0nz7D+7h4lGNKFfyYMcgYPJRnaZzBeo2TflJFQ=;
 b=tFUDNtBSIMxKffSHF68IGkGTkbdJq4BdMJYOl0NPAnjpkA60q6h8OmPSwsuBegnC+M
 ziw1ZI97B37WmtBkUa+D9G4YgkOU+c6nHs31rSJXOZh2vtruPay7tsLhBYJqNPn16ITs
 wczF00QtRgg7QQGH9VZoONqYW5nAdQAO4Xu1tPgGDbyFBpffNGnUepbmmfVfKiyqfz+n
 pmBxmnpQQGpVVqh7aQw76g7/aGCL40f6sdK/qFgk39/RgElIZz+DBJHmZ1FG+NTBjiRx
 FxLbusl+DEnMAQyIuhhnYYHxot4eDT2eajD7fZ34cAHZvZ5JpFjO3Px3ZquknLhbHZHH
 Lf0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Fj2kaPTsayEUTiz5Al286POVHq6++XUZ8Ik1Cof7MGEnZQTqnbjDlBrk669EHp9zqx/PKVxrnyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIGpOIsKqB2D9D8E3XL/ruv1GMtlLU+UF6/fgyhOudwblEW3dQ
 kC0YFZZILkJvf0XLmr+Bs2A9Iv2z6z8o9D97m0q/sv7AJEaFihqY30SOVhE+tXWjmy+8CXTk1sQ
 OmVxvU6QREZg72EQdUOUDbd6r3igNx41YQjqtUkiTkSpD5Fv8qEDMVmCeq1JD4f40GIocAM8=
X-Gm-Gg: ASbGnctERCvn9OP2VUQAihmlnYBPabqLBObYBSCRcvl7ncZnBUVjfm/BkdN8D2ve2s6
 7dj4oy4uoO8v5fnA8d/I1oXBxMVMQkAoGKJjS3MA+kRsPmqt5JhEtaR943GZ2t3wXIk32nqbUz0
 dwMtOpWmZeEsAtJsClMCI/tYapJu4pumBsFUxyr1SL651q80Cr5NShrlwJwceeMC0/8sCUbyzpV
 Fow8GIyc6iPo7lRC4eWxaXsvH2gHN6dwzeCMu0u1zhFLq/LXcagYswImMB2ca0ddHwepKSx8YZ/
 wi7SjVVoZ5JQmiw9hc5XlVq6DCIugcVSi8p5qhBTZYgnzYzjwA6gBFqJSeVXpwg+jhwF8Pjk1dR
 RbXpwIAP3M2qHnqX8yw==
X-Received: by 2002:a05:620a:3187:b0:7e1:ba5:6ee0 with SMTP id
 af79cd13be357-7e62a0390eemr120704485a.0.1753265456501; 
 Wed, 23 Jul 2025 03:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR6Y6ZAAWdnN6iFKod/XOWI6twM2I3VQjkDNOIwbsj0NfFRXCat4cq56yGbwtYclqGHHydmQ==
X-Received: by 2002:a05:620a:3187:b0:7e1:ba5:6ee0 with SMTP id
 af79cd13be357-7e62a0390eemr120702285a.0.1753265455848; 
 Wed, 23 Jul 2025 03:10:55 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612f1312e17sm6525453a12.39.2025.07.23.03.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:10:54 -0700 (PDT)
Message-ID: <ef79b37e-8b63-4ccc-a739-994a119b95c9@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Poll AHB fence status in GPU IRQ
 handler
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-10-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-10-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880b532 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LpQP-O61AAAA:8
 a=wn_gRGg2Iv5gsIDpaVAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NSBTYWx0ZWRfX08O8ImKdywef
 gygkmX+/mG92OGJ9OJObyQNltWGvwHE7k358ESG6Aj8n9NTO2ISb2XuMYX3PlS63t3Lzy3FJPPK
 7qOhob6i9/eDOxBrUFKMnAbtIuHym2ZrkrmtgDv8lCDlskM0HOkXwCbHaa1AZodLeNIbmavawiu
 nW40AekHQbZ0Lkwo/vnZBsmsF/mwEm6IDludmFw4siOhZGgDkDri+sEWlYRkBSTivDw/Xme8p1/
 KXgeszZz+MY2jHIYdu035ZX36JpKmnADZlphVdoH2EJqjECX4WW4CGw+7Q29NoxwcW/TxzNtOPY
 FFA9LNJH9r16R+2wUjIlDtUtF+ndsh2/YXeEruPdR0diiD/38wLgL38IoRWyxEeiKmuhWNiJHl8
 aSQUVDpc1BBlh+BFWQpcdhnbuBOLITclvgjAr3wdKxzu6oZdx67mI9rDwwFtuvC7qG4OVZsn
X-Proofpoint-ORIG-GUID: AGaE66na9IEOxroajfJavbwx39LUUS1t
X-Proofpoint-GUID: AGaE66na9IEOxroajfJavbwx39LUUS1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=807 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230085
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Even though GX power domain is kept ON when there is a pending GPU
> interrupt, there is a small window of potential race with GMU where it
> may move the AHB fence to 'Drop' mode. Close this race window by polling
> for AHB fence to ensure that it is in 'Allow' mode.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

There's some more context in this commit message, please include some
of it:

commit 5e1b78bde04ca08ebc27031aba509565f7df348a
Author: Kyle Piefer <kpiefer@codeaurora.org>
Date:   Thu Oct 19 13:22:10 2017 -0700

    msm: kgsl: Prevent repeated FENCE stuck errors
    
    If the AHB fence is in DROP mode when we enter the RBBM
    interrupt handler, it is usually harmless. The GMU will
    see the pending interrupt and abort power collapse, causing
    the fence to be set back to ALLOW. Until this happens though,
    we cannot proceed to read the IRQ status and write the clear
    register because they are inaccessible.
    
    Poll the fence status until it is ALLOW and we can proceed.
    If we poll for too long and the fence is still stuck,
    the GMU is probably hung. In this case print an error
    message and give up.
    
    <cut off tags so as not to confuse b4>


Konrad
