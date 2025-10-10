Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC2ABCE35A
	for <lists+freedreno@lfdr.de>; Fri, 10 Oct 2025 20:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE4D10EC6B;
	Fri, 10 Oct 2025 18:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+JWwdZd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7D710EC6B
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 18:24:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFCkad018566
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 18:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9upVP/EYtvQuDS97rpn85pAn6Fk2yzF+mqttaZezhaA=; b=X+JWwdZdAeZ3rDg6
 97b9XDrZ/xBR0ZSPHDZS3h2jz4QC5InXWMJqQ1bQv0nAWAQNMBTcASa84rg8MPxQ
 EgJKPsqcBKkMoofLZu5cj57izKqDqDlRvIpFC3qWsPzAj1onspnHiqMCWOxWsrDQ
 qRW7dRCDAlThIgGOwZN1sYVe4twiXPXggsd4a6pFiDQBItqzAyL2nr2psV6iZuWO
 USVwvIUJZPpATqCcYysbx1YyaenK2g7jK0qs2/EWieXSkkej1222AWQKWr2rpDV+
 dBUX2oxt54stYhZd/BW8uRvSIU93lesPCGWqlxrIAUO5lrZrwRH7rfqDmhlpHqRy
 VjhQUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m7cwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 18:24:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-85e23ce41bdso104098285a.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 11:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760120690; x=1760725490;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9upVP/EYtvQuDS97rpn85pAn6Fk2yzF+mqttaZezhaA=;
 b=lSPmWWP1PilIQujjsCWytA0ehg4NjfDRgeNWKjuUXqy/RElByvDrZEU6nU8S5o/5cd
 9NuyhaXOTN3OkGMRCC8p9RKMFv8jWlgruiPSUONzLXLHGg+BrTjv15a8Ms1nh3jezo+y
 iAMEcpPPE32LX0rlayDGco06cBn0tEgXzUwJswT/KRYDcRpm+oo9yQmr9o4jNtDpOuWA
 g7t4yYfbXjBWr7+jDKXC13Wu/IEI46NI9MF2uh6cp+5BjR5ndyXA44xj6byNF0bG16VE
 LTYJYEYWp2Rp4FSHw6/atoU9/ondxOwW30zOMR2mmfArOITVRXTpo7qGPkGJ8gEWX+u4
 OUHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXxjBj1OC/YIsy2N2gbn4HW5o8+Pwqq1IeneHK3LgnBku8C4DxRJFKC7dsnmPmkbDu796MSJksuhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvM+RSr/mRU7ErmQdRPo+mNJPzykL6izCmC6TWvIMNxSGHNbvm
 sO3497XIeDeimWxIPcj681yTJzjwtRCU9hk/fZnycAW1zu05xpHvV1T1BnsdjLgoLJMjp1Mmpdv
 0vpHN57Dhts1sKxqb4Ay5EDT+Hd8iLwQ8BC0dWuH5E/BTXUkH1JIaYtzY3vOlLSuyWbfstZ8=
X-Gm-Gg: ASbGncvBpMRjJJrosC9vG3lR4eCfBtMwM158SjsISz8NqV6KR/vZE6p9xhmDql79AtE
 kZPnXWPMx7ja5ZEwEa7daacE47p3ZFaJ0b5+ii3P26sDepNIvjyzRBEeKaXJ2ojoQ++00oY8S6H
 1NyYiZuAX0ko1UQQTl9QIDG9Vtn3Vx8cXW+bksWpv/IFGKBIkqdjdQTB8kBKf+jJIBvVUlEJeaH
 IxfM0DJXBn8I2B7UQZb4potW95P5UXcOCqkEOMiTy/03Ca8dP5YU4P2/WRv7VHgFIIQsPWtydVC
 hZnSUzPuqtA5Lk9Uz/emlOxTE5JFw1nIsbHHudsa7TPd5ryClfie5vMSQhmqtYJ6UIengY/Qcnr
 fqkSM4nSSWTpySWvw01RlQw==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id
 af79cd13be357-883527ca0b4mr1292955985a.3.1760120689954; 
 Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJDHOXXLxWpzMVsdELZY+jNe3rRfKX4hd2hb4fDYH/CA8/2CoNx4Yo+5Y9x92+KWGKQNrRvw==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id
 af79cd13be357-883527ca0b4mr1292953585a.3.1760120689465; 
 Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d2ce9sm288483766b.35.2025.10.10.11.24.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
Message-ID: <7f10f4b4-a5d6-47e7-9e27-8b6e48866e8c@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 20:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm: Workaround IFPC counters bug
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxn5oLpbk8byb
 C8wHepTnwEUG5m24BRo5d8NAQ7xubnqwALk12awHTOe8rNuEGF3jh1ebqETTcNX+ehumamBXajE
 TdthmBETPl+Z+iinGjGCfJ5W7oAHZfPEp7xJcRanAnWiD2UdTqf3WOgs7+iZ4TOCR1s1R7OwSUx
 bDPUUXVHq/y4aegVf37jSbbhIxLCJGWAD/lqjLPJHEiNTPgJfhqxzQXPsUhb12o7RyKYQkB8lCz
 1UX9rJqzc9b6sdWWOzyM/GGd9tkr1VRi5/iTacaM7uMfvBYzKaCWibAIdUROWfS2HpVne7bHsl4
 xJmt/iX/OqC2TCHv9fbbka5dp7OnkcnmXLybsgGB4vRPXZePzSpkNFnAkB1JBY9UglCyX6RXobk
 QWVOQ+JYSvgfmmE04oJRhAA/GcDV/g==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e94f73 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=LTEgcuO_lhVDbfJd3wgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 2yGXvouFR0U_XIBz4OV4H1ByL26s109b
X-Proofpoint-ORIG-GUID: 2yGXvouFR0U_XIBz4OV4H1ByL26s109b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
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

On 10/10/25 7:49 PM, Anna Maniscalco wrote:
> When keepalive vote is set to false IFPC will be re-enabled even if the
> perfcounter oob vote is set.
> 
> Workaround this by not setting keepalive vote when sysprof is active.
> 
> ---
> I have little confidence that this is the proper solution hence why
> this is an RFC.
> 
> Hopefully something better can be found.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Your sign-off is in the non-git-logged section here as well

Konrad
