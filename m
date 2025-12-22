Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7CCD5385
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 10:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640D910E4F7;
	Mon, 22 Dec 2025 09:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhglG0sp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UoC2OhXx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7546F10E4F7
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:00:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7YvZg3762876
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=; b=QhglG0spVm0QGZ1Q
 SZBd/YM34FpvT2X0InMZs1uuuAtN8Sb4WBPnDcJIcemDtm1jUWiLw+E/VKOpuPt3
 5xNPxP9BqYhEJ6N9HxQDlfm2zDM+jhXyGlg6wqjf+4p4LBzVUNjbc6uau2C1t5ox
 aK2z8xu5nKl4jH6qy9eOK26SH1O+50Ax7VHAbzbLVxxsapAkTtY/koq0PZJwekzT
 BiL1aAE5oYkDVOzdFav27lBIP4i/HNl0wmo70zSzunKQvPrcSMP1CE+ba4yIiW5P
 +j7oV7ARwpQrMeekK/5tcMCsSKEP2ejGW3JI3uCkrXKFba3Hm55f6HdZO2fpOcZs
 OkkfsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4d24-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:00:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee05927208so16013351cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766394021; x=1766998821;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=;
 b=UoC2OhXxxTFY2j2eJ2U+6dGQ0Cgi4gPL8aA/sQU4rleRGH8HynemcxrveXzw44ETHa
 B43jdYGn+LDSykYAPG+wBM7H5lyb/uB/kKYhl0CoSKeobTmdjIq8gT3hov5ACDLAX/Xr
 gnUUYMq5WESDjb+gzlsaS2aDQo5Q79nZHxPYiNbOHKZ1hI/RnQf0TuDYSciMIiUcIDUm
 hWiqQdl/sVa+LQrQ8702I+YymUoJwr/YTGsBAwNw8BbKKPAlmbZqdkLImwRfvP4S4zQ9
 BtdsB8EjcfuSmEvalPbYyif0ee8f+pH+CorrYspZVK5+uG9EqTszBixodBD9bGMVAbr5
 XQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766394021; x=1766998821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7dzW06QAIiAkc0UiQYlfxr0uMo7Khj7kqrWF0YPuD9k=;
 b=Np1TVAVqfTgtCtji+/yncAovALVmevc/Rk/HuDv0cKz+aLfFHW9xQr8xnmOvq/f4Pf
 PCqW0J3NH5nkLQnodqiMBbimK2urqv/M4myy+FZbwMWi9YRLn3b3GWUY3RGawPAFucUZ
 Zokc3nU580MEFTkFQu2t8Z00AP/NBkCfRNL5XLQvjRq0e6ZkDIhVZn8wta47TJ9Ixu9b
 btdCKE/YteOYuMmPP7wNBjrabIjuY39SKFRFKKJ+lOB2nNHaWugou7xOVpeBiC5uAMZj
 gUl8CBgmoJjZ7Sf0EGBlMUtF+1dFwl/9MoWvucNsVrzl7fvWfbw1Y4lf2Rdc/xdyn44n
 hsxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnA4BX/f82RtMiKs38xNT+8P8fP9mRQzZsdL0U3BgBxOir/VwLyUags6SRbnxqJOsEfVck6Ngedv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytmlbNiq2IMOWB01T8tV8RByJ7u0FdL8JonKmeDZhlS0rtBelC
 KeomEM24rKMqETB0uPqzD7dXwwjay/+Pym5QElG68+82yvK0J8B0+JGvKkvWpsNbbjoNwgtl6hg
 s1SFCRdJMC2IvI9zMyI6llkku++H/VMQ7PqODTtegVohRxosMhkQF/E80dwDLQcHOPnN8bWQ=
X-Gm-Gg: AY/fxX5xZQvQWlGSu0S43Iudsnsheic2sXjpZm9lkIxYToTcxJYGODL4YXq+9Own0bQ
 laKkaBlpI0UklzFH9NP8S68xqE2+D+LEprOnfQ1G7BvxWNLBW7UWTGZyPXnqcnbO6avrMB2KlbW
 Urs+7J0trMR454G70wndvXLzlyLDpYZLyTc8xbt1Wjqatmv4Dyp32LdRsxgYMOCGG+Nfw4nikS7
 HgQ+nazJlYvhGf4oGYzAcfr072oXpOBs32bzWphwPMjxCtf9E7f31PbeM5QnUB9laWzCKso34K8
 Fr0ci5f6R0kcZ+Y+IoebfJ25BOlchx4kO5s3autckRWBqsz5obbgb1Vr23Qi4izENtQNP2H34k8
 ACZL/vrqx75a++5Unn4md1NFGMBache5zHKiHn1effu9BkfTiEraEV4UJw1blLbueKA==
X-Received: by 2002:a05:622a:290:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4f4abde8b40mr126853041cf.11.1766394020885; 
 Mon, 22 Dec 2025 01:00:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ3sa2cwix8pdUL8luSbRZkdo1cW7juRVDsscaa4ncFyVB+MukCKD119lgajVKKUHQrCA2Sw==
X-Received: by 2002:a05:622a:290:b0:4ee:1588:6186 with SMTP id
 d75a77b69052e-4f4abde8b40mr126852221cf.11.1766394020083; 
 Mon, 22 Dec 2025 01:00:20 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f0cc52sm1005945566b.52.2025.12.22.01.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:00:19 -0800 (PST)
Message-ID: <0d442547-db12-4408-a0cb-b3d2bbc723d6@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:00:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MSBTYWx0ZWRfXzbZZIiXKpNvf
 VVPso7S4m1DAVESQOvdTXRU++2nwMOb4AFIk+cwzhayeNDYN9DiYh0d4qPDC9WaSgOllqO5qZfP
 UjQDgsiDK57bbIsBDFpv/fahFtMAAQV9K3IqccBsS33bFCiy5suEi0RQDwBBdKrhZQUceD7aarh
 D4jEPsXNQnTyRiqjwF5pxE/0ewXlIYiX448x/P7fGAnAJ3HZMHZVezFFxbSCLxDtrzhKY1KlfAe
 iEnfr5/FNLBXrxQSTnSlzy7mi5O2P9z051WK9FPmZAqk0GSoyrtz6EppKH7o7YtmHVer65ts6Cf
 X47HFYuoQkny2aWM+KNawQC+d5PytlzWkB0XBnyuWm3fHVUs2wwAMh/kjgrZmxohbfwv5QZ4G82
 dCFDETEURyHQSVgFHab3tONWvIkb1DOGpgm47I7VZDLXafHYTBBiMJRU3OdI9WaLpk6TBv3rL1a
 gDwksPjfYxYn4s4P8+g==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=694908a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=KB0s8L93-oSB63ZrkccA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: eB3ru8uySQcGw4-isujBI7OaT2DGYMZP
X-Proofpoint-GUID: eB3ru8uySQcGw4-isujBI7OaT2DGYMZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220081
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

On 12/19/25 5:41 PM, Luca Weiss wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
