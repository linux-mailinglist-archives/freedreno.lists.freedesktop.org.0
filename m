Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B01BCB043
	for <lists+freedreno@lfdr.de>; Fri, 10 Oct 2025 00:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96CE10EB2C;
	Thu,  9 Oct 2025 22:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp17ahPT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9CC10EB2E
 for <freedreno@lists.freedesktop.org>; Thu,  9 Oct 2025 22:07:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599GG2Xe023121
 for <freedreno@lists.freedesktop.org>; Thu, 9 Oct 2025 22:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PR41P3ZaU4FEtAYgEwsHsgOa9cZPdhmWSVDIIYk7xVk=; b=Fp17ahPT8DWjCQpt
 qouBdxGL1HMc6qfBQ5fW9eknKz0/5+fYAXH6FGfBwTVqeKnXsCrtGof8SNNFqChl
 vXB0p1CInUbxoMqW31vKUzukBG8LlPAY+IEhKUX9qYRTPK2aaCV3Umy4IqPsxF1Z
 SXZYRzGntiBxBIdpbPw1MTD/qjsmSCBn2o/mGZf5seTFB59S9odpAcMN921M0KzF
 vQwv+yLvRoH1N1oaJbeePgp1KDCm6Uu/gv1iid4CEI0KeNuygZ6mnT5QHiCJOKB8
 2X8OLjzYRY/cVhU2ii49bg060HRAN/F4ftjh83y/pP//xh4qQgU7yZWwE1Nzimma
 pM+cUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49pgdsrue3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 22:07:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-33428befc49so3632450a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 15:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760047619; x=1760652419;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PR41P3ZaU4FEtAYgEwsHsgOa9cZPdhmWSVDIIYk7xVk=;
 b=vhZ/UAqTCPeKYYhGdW9nW/50CE7DZ92Zg/A5ss2i9tHqiiANXTnQlgJfJhNn5QIzsY
 Of/A+7z1VPp4wrvE5jTjVzcuDP9CtNa13Eurca8Le5NwzgPfpegf9V+2pyCgnj6OtKte
 9F0MhpAbf4aJyrqZ89E7+Lz2OhBUrjAdx331vWt9gm4nNZpEt/oTLI5jejlt64kxhA3/
 1OtjM7MaMQGt2h+LLySDawxAjh0mkhPYmnJfIWvItAj3kH0vOv3ngcLjehvTQAb8gGe0
 JufY713QeLVfIG9MqsI7Ku6O4N4ckf/OkIHovI7Yytv2GYbqqf5n5E8++2msCJ08Q5Ck
 9S7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Ci7j9sWNjZju2uDw2+MwL2V9RRVA0wgmtym01fyj/9YHdKcsvEIAgVbGl6xhi7MIxyhSt2dhWNw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkossGt1dn40IZ9UdejylfvEbkAB/311BZ+HRSULEcEYRJmVFT
 tUac3qS7VSffI8R1SwOmD+4+QW/FKP5fFntAOMk18deocFqTzLpT8d4GzkCo4v5aIAnsw8Bluo4
 5yc/RUpaDzmaqFaM2CGmPm/LjLFGYoUtArMn7dwRdHMlMUpBCfZQeo/lHlT1C34U4FlSNdJI=
X-Gm-Gg: ASbGncs0dLZn6JuxN0rH5PuCMhJ5JpeOxK+vsHISDIQm7zpURQYzpCsp/v7HatIQOKP
 128rUB9qwm5POYIAUxczf9MQJh0+fJs/y3ZmRec4q4NdK66dNL7g80XVxiznDlURrRf6tJsQ4ju
 AZGdXHQsq8XBkMoXbpH69+26cN1+Nfc0tMPZI6O9mrSSe/LxLgMnhmIc5cGOFhw4D3/kJlIEb71
 1x+61+ddIVIy3RfNFYLudOdfEPmCgz/e9Ou/I7Zc+GAWbJOLH2jh9DADxj7zktPcDf4KyBXPWZX
 5MmSMn1Yt5Xqmb4HwDBacdD75H2MmfDqxlEu3oDzcFex89nfobMWfeoitFcdDTjlANwGPkfRcQz
 1NYAnLIz7jb6zBHu5DC7DqBvEvRE=
X-Received: by 2002:a17:90b:58ec:b0:330:a1ee:e119 with SMTP id
 98e67ed59e1d1-339edaae564mr18570382a91.9.1760047618908; 
 Thu, 09 Oct 2025 15:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4fyyM+GG4JOApDItPR8uaTlgz9TNMfnQuqAW3pfKetHHZhA+J8uV0VeyiU+3SyCfTwZRmzQ==
X-Received: by 2002:a17:90b:58ec:b0:330:a1ee:e119 with SMTP id
 98e67ed59e1d1-339edaae564mr18570335a91.9.1760047618340; 
 Thu, 09 Oct 2025 15:06:58 -0700 (PDT)
Received: from [10.71.109.75] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61b0ed20sm908807a91.23.2025.10.09.15.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 15:06:57 -0700 (PDT)
Message-ID: <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:06:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X9q4sh7p1KQvwuQSuCvGOeku6daH4-Be
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA5OCBTYWx0ZWRfX8z6zgT+VVcgd
 KvlWVv3rFHW9+MgwiF7nSnw2zmFfHVyjmixIDqkc3vN8T5Otuzsb+VDGWsR/9BCWPWtfqXdn2VW
 XPY9jbxb0tJHnxOGqpNyL5zAQPPfVLXOeo6RrexQ4ncDoQ+OverksfGcodlvJD5BhcIurYCumAd
 5k5B23GDw1RjhJ5wnCMiKTpu1SSE6q1JdftGEKjVa3tHH5XfTFtx8QMh6SSxNuEd1bIVboNS0rF
 wWPQkOSOs25vMbrPiMzg1DCchbMcb70h1hBnQkP2QuoHcc84xsYMz6dxxmlVO7eYAKyUjpNuGFA
 +D9tgaqVFi+S2uSVkn660C77s4ZOL0hya5hnOhQDVmunt/fvABiwS0jVCF+DTMwUGyOtj3mhxEH
 38Xe1aeI/Y64jgTg8kNuWog1YEaXTQ==
X-Authority-Analysis: v=2.4 cv=DISCIiNb c=1 sm=1 tr=0 ts=68e83204 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=HXVKm-MKDGyxfSjg48sA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: X9q4sh7p1KQvwuQSuCvGOeku6daH4-Be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510090098
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

On 10/9/2025 1:09 PM, Christophe JAILLET wrote:

> 'mixer' is only zeroed and is not use. Remove it.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>   1 file changed, 3 deletions(-)

Acked-By: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>

