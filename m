Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0BAC7B8DF
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 20:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6404F10E8F7;
	Fri, 21 Nov 2025 19:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbgTHNzJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViZp9ykD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EE310E8F7
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 19:37:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALHYo9F3048209
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 19:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=; b=GbgTHNzJxiwG60iv
 HD8Gv99UTBNl69R4AODx+UGk6mt+6wpw2haFRQ6B/Iy2Azv8g+1Dd/2vI+k2yfm2
 HK6ahk4COUcOSugalgcpu4tVnjc1uuz9CRRCWf/Vne2GtHxEekthmW/UCg8jAPPP
 9A7KmqHkBDjmAT4H9wgH2DRMNb9UAEd40a754DnAH6yzIBbGHoTZG3FXeY7dazkd
 aB22WCqJxmcDtD9LEpvB1MhnJDnzSbLBnhzMVv2r6wA6oGItQ4NwGI2XGYs8Ue14
 EiPP30qKK51ZCZnnHOV8r6+b0ZNCEhNOOMPKvF/yxi//lHBV3F1jVAlS4uC68qK2
 2kn1/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjsu91-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 19:37:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b25c5dc2c3so55436585a.3
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 11:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763753833; x=1764358633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=;
 b=ViZp9ykDYQswzL4UEN0Dlu81D+9ZS9kb4XWhuHMo/uI+X82V+IVVwQMYHdQgla+sLn
 s8Qj7itxJqeipbmwLLrbnvxW1eqlUau+Y9qpreEm1ncOYwOpPMV5e0DnJoYN1rd3T2nY
 FDYri+O0eweWmdn8XWvYjAwPOXnpY86cbvSmQwvPwiFjYWk57zcIdcMTEWfnjXjiz0CC
 le82rgV9WkA05b26JKiTj9uvXzFpxk32wsgsY6BYs5rYuYwTS5Dpqu/tQoiD56LbiECp
 atM5VTsR9dQUp+N75ApTUEwMO5yGGcrt720zjtys0PhK/6Q+zGwP21MvB/a3pdbh0Msf
 XZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763753833; x=1764358633;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2UKY3JHvvVjzzBh1rIXfinBZUBnXWiISJPQOD5ITho=;
 b=BN/2DooaCO/V8DWzwBqW0T4k7kZEALdNNTQarM5qCOWTNwbK4bkN4r34+wgzEeIxx4
 o665jFQvwDmUjJWWyZA2IUHkPSsjKrrioUJ21rDV2MK76aRy+N6GYgcSntZfyfR7qch6
 AjcllBzcsHSDL6XYKhr0aPCq5WwrgBmvroAy9QHQV2HgNxdbocv3Vp1vk5ideFYQEqxW
 ZyLQM8CprW1NPuFMdQ7Ws7KYnNtnfMKsit8KBibh2oTFyU2njoX1Pcv76+nrdq5VuG0k
 PdX4fve2Pf+cqwSF4+vq0kHEsC/mo5CCBTO8f6L7j7GOMd4Go0LdjKNJRg0//hovMG2L
 NzFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsozdTTtoRisMxgFIHZqAXt0YgghpptsIY7kmwsSWXnidsUrvpqGNK4qihVWYjWcVhpZdz/f9kiHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhj3xlPCXLvjdLOOqex0NuJ947W14YIdNitmn9oO1NKTvwS+ic
 3cvPKY8XIFUWC5Klyk+4tDo21+g21T8MGIyfo8DZ0xoyczz4E5JOlPwFIgmNWweKwbwzDiV/qP9
 iRd3o3npEUxgXmsBmKK9hWFvjF/LQlDPU5eA+gYuIPWCuGasICUqHC+nJNeRkF+dYovRyasQ=
X-Gm-Gg: ASbGnct4vHTjmp16Hl6nOQftO6UFJELDmbFaaH31b6pGEvqADmsd0DFyS6zPm9CFh/h
 rHRroxWdQfmVnjMYuGW8xSZTeOEXFErhT/yChxadtLgjyDEUuCYDED9SsieBr6bN7132XHnPSuG
 sJUASh5ypsK73YABJp9Ci7zwltTTjqKTVHoBTMtnItKtCZRHn4tHW/vuJF/WzhX+7oecU98Vo0l
 ZFwUFSj/WD8wOdx1oQC/Pn5l5wAdWbEL7KEKLkOsndetSTOEilJlRXLpO9G6c9PR/V2EfxsMX2p
 IQDS+02vFfRhWR7i1PeB5MfavqvdnowQLPunLlgeaiTpNENpmc4yQpnbNqaZar6kxl93HewR/NQ
 K67f0YINjTcw3rHFNtmLgz1qwlNMJ9c0nUJdrbdWmrs0+IWPuas+t+PpGjfrRCZBAAes=
X-Received: by 2002:ac8:5fd3:0:b0:4ed:6e12:f576 with SMTP id
 d75a77b69052e-4ee5b768c8dmr26806791cf.8.1763753832663; 
 Fri, 21 Nov 2025 11:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFASboIZYJmm1OIOATNZpv9Q582GAZ36afE2oDGOITF9wMwkr/HHLieiHtkGicM6auQB02NRw==
X-Received: by 2002:ac8:5fd3:0:b0:4ed:6e12:f576 with SMTP id
 d75a77b69052e-4ee5b768c8dmr26806481cf.8.1763753832074; 
 Fri, 21 Nov 2025 11:37:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453642d3e1sm5088292a12.18.2025.11.21.11.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 11:37:11 -0800 (PST)
Message-ID: <5984c06a-6914-4e76-ac15-e28b6928b593@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a2xx: add A225 entry to catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1nLBiiKsaG8EO-OvutbwCamfJ-UNf5PF
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=6920bf69 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5GMbN-XtZ7FmluJEMAwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0OSBTYWx0ZWRfX9vP7slxjp8lT
 w945FQ1R76frTlQ9c9IzZnDk0DJaaqjtxi/Ov/yr5hD0m5ivkobE9464gWozhb+bnUSLORq94vO
 raapO2uU44QjRYj6+LTv6ke9JciiKs1R2Rv6WrMxeKDGIhhIlWp/ZtOxZ3PmlDCCENBI0guPKfl
 7rk5Gn4av9+4N1EIHxg2vYbM3GWQFgb2ojDzYCX3Us/GgjSmDBlglC9E6XMFt1yMEd4U0fK1KyV
 Q8HPw4YrT+ucIE/LDmwArdB10nYjEyHbUHgMJWmnnmk8MAGWJxFxZQwjSyx9mGjVaxWonN9wxKe
 1RTOMoirjcXQRR8V20/l9QZOTqJq5jgvETTOMJYNyIMHPKBPzVMoWDg6mitz6H9DbllbNatmQbU
 o2ReAWZnRaE+7W8oHF7POyOIOJEt/w==
X-Proofpoint-GUID: 1nLBiiKsaG8EO-OvutbwCamfJ-UNf5PF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210149
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

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> Add catalog entry for Adreno A225.6 as present on MSM8960v3. Most of the
> pieces were already contributed by Jonathan Marek in commit 21af872cd8c6
> ("drm/msm/adreno: add a2xx"), but weren't enabled because there was no
> GPU entry.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
