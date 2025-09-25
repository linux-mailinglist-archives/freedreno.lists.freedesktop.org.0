Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC41BA1C72
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 00:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543AA10E2F6;
	Thu, 25 Sep 2025 22:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNA42WuJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FA910E2F6
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:22:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPkeH014389
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jRfNzZCnLAcaDWnEKn5/jyR8
 JVxVY0FW7A/2m5ca+aA=; b=ZNA42WuJqPUVqpxupotcXOSumqsGQeqSTS9bIWOT
 CGdDK2bPRKCjKOU28jFPVGSaR0l2q2VAwm4qc5UaMvaj4Raf1iuRJRvHDmvayXsz
 mSyEmWADs103GsYG6UOzNp+qUL4PmHVyDmLYi4fswJJxsXPplAshI0g0azKhoO1/
 /EJqarGPth2iqP5D50/vTFy30MYniSxbs4d3CIV1FXj2uJTfhiZ0Fyp0mD/4bv/S
 SsNkVQWnrx19iDWzDS82A2vKP22k0IQXgflA0Bog1MIFatQPfKQ1aRP5zKJenhEc
 qsl4Q1LMsXztc7W3eE4SKfzxFilm9pZRc/dDuVenWZgSdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rgjfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 22:22:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4bf85835856so40258731cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 15:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758838931; x=1759443731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRfNzZCnLAcaDWnEKn5/jyR8JVxVY0FW7A/2m5ca+aA=;
 b=GcNuEY9IP5mDgsxgZZyA89nmMVWSHgvZfb+L5sICtG6vUcGAF73QlI7y7QEUdhQ96E
 tZTgxT/f7k4pDYIbgGlQHtU6q5re8Q9u4m59/kjfM5Ge9NLyPAgQO6XHJhrvB53paTCG
 IhJk7ptWXRhUlEmPQZzA/T+QCBPJ0qW4A7OPosU7O29ZdMmI0LhzHUf+q1iGk0eBLeeK
 1nXx3mAsPMrhZmGMNq8opNLHZQlezUaPn7dRUiqENGLa2Q3sP5U0n9LkSBOquRcvdjDa
 1TiqhcbZzU3kuRws8w7t+MxFGzviKyiNNNB6tFbNNpDrYUWzSzPlZJg1MX43Cbwks534
 aBYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+uF2dUSqpE0JyxYhKPdhBqnX0Us2XNmrgcRAzZMc8TxDoSUTMlgWjw3pPEeoyWQvOlmTLrJhx6k0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhvGthSWzT1vq+SDMOHJ0wBt19QSRhUFzyUvPss0453H9IsXkO
 oRBBfPsskCxICBnclEuV9Fspg8ZmPpW2CbrjEAI20F3msBqQnMCHkV0XW/V8wsJeESUqlU0CEHa
 cFxt38jUfKAp5bqPwXVGYeAwjepm9oec1FlIPHNMjuk/N8v7fpetqjuGJCv6llls4imzfmgM=
X-Gm-Gg: ASbGncvVcwqWBhmZsTzrUpN/A+SGM4Dk+mZYmwe1xadNmvmcTph92LAfNwFPBhvV8mo
 g45TF2OIz1tqJeDnIotw4pTJsWRSWobzdnQju54o2v38qQ3CoCUPjk0ZlqpearAgItSVWu/6ZV+
 Dl3kmJBuqcOfL00kAlEUgDR0YJK2YZL90+98P3FVp3s9xdHB5OwUBY8uqJEgI73tQEOXzI0UEZ9
 zdGXbP+EoFzI86dhHBt9nBozGMoKVbfg+EHtXZxDxcHPjS2heZRyE4ywbnYLZMzBJRE8GhDwRyq
 lvm2+6gMJDmxXchEI1khy2iWienYwU/OonCnrZq36Z0Rcqb+dU920jqLEhN16sX3NKRjP6D5tiT
 at7Ac0OgNkGrX9L9aqacf0CMCGRKJNlza5EwOyD4kgOVAXWfnav+c
X-Received: by 2002:a05:622a:4b:b0:4b0:6a6c:c8cf with SMTP id
 d75a77b69052e-4daca1f78f0mr51621461cf.15.1758838930666; 
 Thu, 25 Sep 2025 15:22:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO3r+ySgumuy0R8ZW76Gz42nyn6z1QUTob1YhU0jpfjtecRv5c1wNLaL6B2ApNmXtWNxgQww==
X-Received: by 2002:a05:622a:4b:b0:4b0:6a6c:c8cf with SMTP id
 d75a77b69052e-4daca1f78f0mr51621141cf.15.1758838930184; 
 Thu, 25 Sep 2025 15:22:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a31df6sm1135993e87.111.2025.09.25.15.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:22:09 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:22:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <g7kqqed625hlz7yq5uwxyimfupxryr2et5jxsrmgw7jk5x5zg7@zdrgqf63n4w5>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
 <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d5c094 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Nu1Um9oaDxGSo2OYYacA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: z9Yie2QJBLdkhGk0rYE4HHe8WitzWSt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3RHapRdqGjWT
 C/tSa0RVCWJSOq7Y49M9Cm22xdxnxcsbXKvt7tQND4CtsebVLSFmykzSV+nTUeGuCbUvVsj6QUJ
 Gn1Rb2flMXQu5YRn5Fk7A6f7zoTc5e2rsKpGCAPnQWnpN19ln2VAguzGRZqcHQEXSEhWfkUNb0m
 mDJ7ExYWFK2CjDgYljScqwt83F0wNm+hCGZ7HeHVaG5dTA3n8ax0UaJnTiO6P2SsnWw9ipRWcLZ
 U9q78raGyB7QDb9f70jRJx7OFeXRaT6OcUYwTtQ//HNexhnfIp2ZjY+cM7BLsQs3+cQWws+Boxq
 c+FNjKtuQw2Exs86nWOPrcla+3jtDKiFAj+qsBOSccRacd2WrBZa0C8QbKQtxF6jwFbecgGW7ho
 qcesiNemI8EnBqURUTKe3nQMoQraZw==
X-Proofpoint-GUID: z9Yie2QJBLdkhGk0rYE4HHe8WitzWSt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 09:51:28AM +0300, Abel Vesa wrote:
> On 25-09-23 16:03:50, Jessica Zhang wrote:
> > Since 3D merge allows for larger modes to be supported across 2 layer
> > mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> > supported.
> > 
> > Reported-by: Abel Vesa <abel.vesa@linaro.org>
> > Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Is it also a T-B? ;-)


-- 
With best wishes
Dmitry
