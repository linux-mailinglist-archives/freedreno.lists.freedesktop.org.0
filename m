Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660DCD1D9B1
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 10:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41AB110E5E8;
	Wed, 14 Jan 2026 09:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwW6/XG2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeVj4Kyp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178C910E2A4
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:39:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E7jN7w2789891
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=; b=XwW6/XG2vIXEXkjF
 SvKwsdKwUQiSBz0Hfw4Q7KAT0DF+bf0qYMNkgomj9n6KpYDJOWTjxh6Yy3LN530y
 7S7SYuTlJ1AocYPGzYaf9l8U32ZmUn2lN6b/jSzfBOjZMm8zrQ3jmfPE4ky7mFiZ
 T0AlUccn5iEn8+qoY/aP1nJHVGvpVBYmqjNQAk/3otJRdr9e44TPcdYfnF95H41H
 yTb2QR1sueH4Mc5wTH843T8ClCK+fYcbV5PsMsFSvpPL0j4x0MncReJaMvlKyV76
 PuT2JJq0dv7JN1ic4gafb04oh642Q7CxZWk36w0K+g4cTv6SFjbsn+kQgA+SZqdX
 4XXHWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7vabed-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:39:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b25c5dc2c3so175504085a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 01:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768383557; x=1768988357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=;
 b=HeVj4KypY+a7JaAfIT3OjAvKJBN5l+SjdADx/0s88xtNuQtsdcQX8Di49Pmf8f2uKo
 zUX+/QQHQJXp+DjNEGRGmmaw/x5OExh8v8dh57ovCNSnAOjhxpD/upAU7wrRu19XE2cc
 csYC5yAER3EEgUBwuuPi4rnqhw8LsM2NRJ9NtkPWnTSHW1AC2cvGu/ELPuqrxct6nh5j
 QqD6XajFgSDLwxXyDVrF1emZUp4B7XtEy9CWok6BgZF6+YtLW5AjSckMfFRxpVCOgkMt
 zgBz4MOq9sZNPPgh/HWdH/F0ro1fzHvB6CCHDRxNIM+0Ps2YukJwTWTnI/iN+uJHX62W
 hxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383557; x=1768988357;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bW7hurFHBkMVJEHuJgTkpaD0kO00VP7nzaajP+IP9SQ=;
 b=YN4ZaEzReds1W6gjDacSCFDeJIgFROiZG2lVRG9x+ATsBQoAhOKn83zuAWW5Wn0oka
 X5DaD3KWwoblvxg4NoJ8RnAJtdomSnPcMvkx1+B+Uvo66v6UgUnyW0xcnQ1EePXSCiDU
 PQSjzciQaN7nHqVqYLcOZTidHylrOVBYwBckTbqYML17g3kzZKdI/61sqa669M7vS9bd
 n0xzCBWitLV2wl0Br8XgE17fYnYakFFwmsdvOn+LLqqoFtfmI2xUUgNG7PgKHXDiOjq7
 l7pBlotujw9SlJvIiu15hz43TKFxYZJePQKT5eQRUs51HcQNE196u6OjpGxx3ZyaJLTr
 c24A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXISHMMOTw8dYqAyOPuam6aQp+AnntNHiQLykDMDEUolHWQByrCiHtQ5iK3fobmdbjKxit0TRSvCnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqCLF7R1jK83bOgX29rCyzcYkz2nkTcZXx0WkrdxTWxHP2VBuG
 rtt3lIb2qrFiC90QZCu6OZ8QcDNXj2rXzS6Z+4c8W/2lIMFSfTtXNP+wRm4OgF+nOkwsZeiX4/B
 IA09EEp6ya57kC6Dhw3V9L0ZJFHwuHwJuLNEsifbaT0SLdkqOi/9tq8tqUtfZZ7pk4buE5Z0=
X-Gm-Gg: AY/fxX6Crj9sD+MHKZARzOyGXTaaVeGfROQqCpt4gImQ5HCvAVTziV9253/3qyoAOQt
 G081Z53hnXrA9I7CGPUKKSRGS+QhJaTI7F8MAei8gzYPBj2HAZWuy7FSVr2YjCPJwUxHxPucci0
 6pzCpPpal7MbxUaBX5sMSlSKw7e7NOLZdkYj09wm+b8BvyioeP3Qz7Xm5iniHl2cgiam9mSUszj
 oZUwMFDXxGwP5NldGAyq7PhPWRcqubmXvwM4WRNxCit1GBaR9TVwtxpJtbj5idt9rNarwtR4HE2
 v41UpbtG5djwIfluvw0S+lcWDCr2HwUeIKTMB0ZkPFl+PTNYN9inB1KDZ/WhAuBWircCWshbEbn
 io6Ffang8NFLfSHckx1lwM+QcvqoR06WgO45cy0lU9V3qTBniODnPqa01pHMk7Yp3WWE=
X-Received: by 2002:a05:620a:7010:b0:8b2:9aba:e86e with SMTP id
 af79cd13be357-8c52fbeb24bmr205579785a.10.1768383557392; 
 Wed, 14 Jan 2026 01:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:7010:b0:8b2:9aba:e86e with SMTP id
 af79cd13be357-8c52fbeb24bmr205577085a.10.1768383556843; 
 Wed, 14 Jan 2026 01:39:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ebfd08b2sm1288984566b.25.2026.01.14.01.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:39:16 -0800 (PST)
Message-ID: <c64cd28b-58f6-4d91-a3c2-eb54effbe898@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
 source code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX9dnCa/no5LXI
 OfsZkf+sWilNRlEmoluv7XXiyhbkyd8jQbG3WzKkf3FAQYZOxKEaSGaz3WKoCNllXWpCKWheAm8
 t542/Ukxq4xnIPKCwrwrkUb2Ym6yeQolcyo1QjX0qaelj8xDATGMDnFn6iiTEWR4lrhwd2DK8/T
 oaurR6EP6kT7K3qLXB9BkJ5mKn6TR+LieIbg9W1yaK8wXWlfu1PdobThArwV5Itv9cwaB0teaXU
 5cXDpcc1RQ5NSqV3x1w11VpFeVDeimO7Xo/Q7Q/ezIwqo/MmfsyyhcYzw0138tB1ac92p9oo8s2
 uIHFwKgine6Jdtz/T1871MK9UKN/tCmEd4F/l7TWexChqP5RrCpvc08sy1tVQ7soQrctrlIjR+T
 Qo/VEfYnnfodN961nnF9cJEexMJRgPoUNr8hHkjg6xlg23FX8bV6uF7PBRE86DIXBRVkbN2lw2H
 vJykGIWiMNAl6T7asTA==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=69676446 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BAgg1nNj1X2pGIFylwwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FO9kCdyS3rWvq6qo4Pk0FmQzgTzrGcQf
X-Proofpoint-ORIG-GUID: FO9kCdyS3rWvq6qo4Pk0FmQzgTzrGcQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140078
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

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> The min_acc length can be calculated from the platform UBWC
> configuration. Use the freshly introduced helper and calculate min_acc
> length based on the platform UBWC configuration instead of specifying it
> directly in the source.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

