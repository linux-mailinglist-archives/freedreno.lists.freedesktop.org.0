Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F0BCAFD1
	for <lists+freedreno@lfdr.de>; Thu, 09 Oct 2025 23:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51FB10E24B;
	Thu,  9 Oct 2025 21:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyUTD9rm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A8910E24B
 for <freedreno@lists.freedesktop.org>; Thu,  9 Oct 2025 21:56:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EphSA029228
 for <freedreno@lists.freedesktop.org>; Thu, 9 Oct 2025 21:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aXc6K5FtfcVXCLUBSxVt1McR
 pcSj+yDNhIZwNeN9Dac=; b=QyUTD9rmA8NOJa8IAHnoJvNHyfr1M5380oyJsX3b
 R4DqEb+ay1JHcls/T/Hh2H4+ZXJdFtqmUuZbM3/oG0sX8n8y1/VE7RONq8l0pkxM
 njzgs115RQ7eMC8o+DC2TcEU2zR9R3uDau0fRg2krkRwJeZLiVn/O/1WFFvhl8fI
 kCUPEmG2MuZLbuhYawhUHGsTa4mMmcVViUxmShgs6d0LcjAmRFeDcUEEhHAH1Y+Z
 7vLtyLuUScfZFMon3sCuyCuI1AlG8YCvgNEkigwWYn3euk+fIGWGGrzbCoULSYu+
 Lio6gXm17TL58qigBe2HL4DxdeEvdDXgXaXeg08oaBR1cQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nmcnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 21:56:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-829080582b4so502382685a.0
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 14:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760047007; x=1760651807;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXc6K5FtfcVXCLUBSxVt1McRpcSj+yDNhIZwNeN9Dac=;
 b=eK2HQGsm/8egY7x9TXyyUUPUMCV42V4SLFC8z27noLpAEonXyZkWLy3Uubu9FAcWwu
 m3wEpzCLMv85AGVPE+XhYDo0iRvHKRGuJy7g0Kh7jLDKr+r+l4CdbN+8YmN8OO9zSwHS
 Dy9vm2oyyUxkxFydFPKNjx1YWa1Mz1zJ1PZN0rhdsIIqsdCWBb36WAmiAheCQ4dPqjSA
 D77kMPxxoYKQGwCSDnDRw0lV2Ohzbgg7sA9uhdY9ylDoQ/6zZ94cUgg+sz7xfnUH6nrc
 XbIw4ETuxdHG2dk2WCpeZyw9yykcUGx0Ozz1SdHjvv7SR61lbhwuzxG2vCT2lAUDrsdR
 n3VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOyBdJHhB/8jaGkjM/M3/b94eHA8CWD5cehgQi8abNF+kOhlWopH0pjiZ6LmUEw/Q2DImuxyes/GA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw45OnS743Pyx+xnlSJi8TcsFm6zhCnzNYfgockZE9YuoCg93/E
 PqhjjKT+76WEMD9ZxPOKsnaUs5zQV4Ijy053k+RrgqcbIpN6cQXsVGs2eM6RdtV7pNK9rdyWzN3
 V+HpC/kFyq8ZSruWtkFkR1wQujJCSHbvU6d0CXBy6Q2ADrx6Pnrg/uIWev08mPrEuLdEk0Kc=
X-Gm-Gg: ASbGncuR56TSaw5gZrHukU6t6qGxkPkjL+FBZL8m6GrIeu75HQrZT4yO2rvug2Cd7Aw
 IKXKuVx/nnC2L/Eoib20u18FypytmYFpPJreNHcPS5Ee2rHQJ6YYxfbHto1gFqa6WZR+nl6Br8w
 KimScdSubjeAdXqB80ZN7wjUyk/1RS2urh8wTYXlzSKhBneazRj/E5dS24sAVHAa7V8XbSWFcBf
 uDa23XfkWqcUeqVdptENewSXU15UhflhCzuVzFYCpuUkJVqMF//ASHggxhw9AMeh05BhqhIcgQu
 MjiosWhuXUSIpY4uuDWhgxLj23QBO2ptZ0DYILzUPphqkk+rhcb78o4KoyJ6rqzJlBa0jy4vzE3
 beHAIvyzF3H+sjlopjUVCVw8jdczyADej557IRcKFEPPMfu0yYTdJeTcDuA==
X-Received: by 2002:a05:620a:1a05:b0:84d:a352:1853 with SMTP id
 af79cd13be357-883502b5269mr1331695985a.10.1760047006537; 
 Thu, 09 Oct 2025 14:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSe8X1c6l0Woc6nK1FL8k1XI8rlfvjiZmvEQKYodTgIRwNv66o2mRudxwpcphaC7lwUMm+yw==
X-Received: by 2002:a05:620a:1a05:b0:84d:a352:1853 with SMTP id
 af79cd13be357-883502b5269mr1331691785a.10.1760047005925; 
 Thu, 09 Oct 2025 14:56:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881e4f99sm225146e87.7.2025.10.09.14.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 14:56:45 -0700 (PDT)
Date: Fri, 10 Oct 2025 00:56:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
Message-ID: <vipgohc4rdankw2lcitdeypzpnqicbpccqcs72e37itpxj6wt5@5govlfjwyqxl>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/IxSyCPGlRpy
 /qZDAfKhsrZjbSjMFWumY0XIc+kCJn1p5J2214LtT35sz/0PLF1eSGPrx58xLMmgXRjDoP8vkwc
 WfANtoXC6KgwZ0bXs2FNSfXR2Hue5B9UjW/9cnoOSaSb9B6ItuF5BTsVD257uOBlOiO4HMaLtFh
 hd+shXbgQbklcn6doguvAZL3iXdoDVFh0Kfj3ZGo91ebnvXosLhJeuMgHIk+e1tfMrKM00EwXEz
 ww/NSsq5dTf4emEpB5ERhyLYgZZw3KGHmoAO28r4a2MnSoU6MzxPBFpzG1kN6SUxYvBXTVv8MAz
 BaMVyiZVdd7mVolkJXMl1Gv4KQlamlmgEG3F2JxpuZgUuLoPw4/N82eaIUtYFY2pMnhR6JHGc3s
 8Ik50YEiqjUMin65cuWg9GJ6fB/ITw==
X-Proofpoint-ORIG-GUID: gEsuEmey767hRbTYzRv5U0H6qx6WbzR9
X-Proofpoint-GUID: gEsuEmey767hRbTYzRv5U0H6qx6WbzR9
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e82f9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_rVczFtdL_8dPuQia7UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Thu, Oct 09, 2025 at 10:09:32PM +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
