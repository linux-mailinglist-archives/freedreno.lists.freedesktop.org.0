Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134AB260C4
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 11:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FFF10E0A2;
	Thu, 14 Aug 2025 09:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wpo3dVKO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A3210E0A2
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:25:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8rM0X031371
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fQEfbuaLjFND5gvC0GEYzyTZRnvvz4KEBmbZTTE8pJA=; b=Wpo3dVKO5hxQD3NH
 p5ohTSa2i0kyFkjcIaBWIMoeH+ONo4zWYBEUTQT9A/SUkw2SM0zTquwMnExCmCX8
 3m1KbKz3f6P6XVX/q2ffetM9WObeyXBaqezUx4VewqVB6IJ8SF2KDmnrtOrA7XoC
 7BN8adfbFFDpx7Q43hydk9ZHwaD+0sMMU7dFW7tIK4tYEolRZzyqnw68s04Rei2N
 vNvW5JLNu+pLRmQ34GsnWbI7+Xs4zfquZEcrr3c+p8UwtwbKJ5QHxN4xVWrh6ZVb
 Ex3pKKwMjM58ke5/JQv6aMT6pUM5D9qVgutqZM362o0itkZG3YsgWB7V2LNIbp15
 ch9z0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vt1j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 09:25:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e87051d04aso29251085a.1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 02:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163519; x=1755768319;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQEfbuaLjFND5gvC0GEYzyTZRnvvz4KEBmbZTTE8pJA=;
 b=ITZ2/blepro3qZLp3fjABJB3m1XpXo88vqatnAFCJP5/6XrLNCG6rPTX7jBa6d0y8e
 Wx9XrlVRUu6rMdVtKJmm3m9wnEHf7urFVzheuasv0Q5ru9F34T0QGhYZeDRn/CWbdHlM
 3nSG7nkw9aaIUVfksqKT7f71NclV7AdMHhNhxbYdYGuRxd+oPy3tRZHmZgSX4e+Bpn2C
 A4xYyzWuxKHrLENKjZIJQ2UsQhUq3P49qKkWgKENXopCnpWtyDFbLPQr/58BsaGLChSc
 RcOU+VLsLLXixgkEqyQAQbFjyXbS1sE1AA1/Vm4vm4Oqg1rL4uaSExwJI+1P7VotPbMD
 6Kvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrLgoclV6s6pU6fjzL5yiXurFQTi5F0YdPcCqyJ/XoBj0KQQyJyR2K/mPBcNHi6PSgrzmgg7EtIog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxrp3LaJ5NJh4OuIkus9pUot1Z0XVc256tMVebqn7diSNuUjBgb
 QQV6Ana8Xj8BXRq1ndred+jJcd+XyxTPYtvecxgDsOJDDyiHl4f5i1dT8iri/qyNZlxLUjW1fMg
 l0XLj82sslOAnN7TWCoVeaoochrrTUf1SoQNM3nl+BuP0ZRl6sRq6FzvS4reyiA+n0FdH/IQ=
X-Gm-Gg: ASbGncuWF9CUYdw63ePevqy1hYUyWTRcDS3owjGFU/mUy3Av7nLPxZAZLEXJNeyUQXi
 gKRjcaWQzxeK9r6MTFG/kIVgWhCgaA4PlOu6gv4NgQVlUHEuSfWXd8cMQ4inyfLP5Ay7Ow+Peid
 PEMVLXk3Ozff5+1d16sU9djAomFB/1wLqeCUehnRAcqCNosjX+L31asv/M8EAjFOGsCgKWri8a8
 bTDspKDdQ60epoxCayR53TTbPWnXqzxf0npyrabLakq5xP7YZsS4hJU5HZ4XIwFw1BJHFP1jjGo
 b/e1fvfdViyR4Ghy+1srWOctSTTsgU3QW8Hm7ZjuB+gxY9NU1hqyLG2jfpoMj4ZLuVM2Vz8WDTb
 1BhkbGiK458XXWMzmvQ==
X-Received: by 2002:a05:6214:e89:b0:709:f328:8f05 with SMTP id
 6a1803df08f44-70ae6d09624mr15950246d6.2.1755163519246; 
 Thu, 14 Aug 2025 02:25:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAQIFb6Sq3gKxyxH9UdwqYleE2mbGjbAt6Qiph21glIclnybKJm4av+T+Q9lLlN6r9HeDNIQ==
X-Received: by 2002:a05:6214:e89:b0:709:f328:8f05 with SMTP id
 6a1803df08f44-70ae6d09624mr15950176d6.2.1755163518772; 
 Thu, 14 Aug 2025 02:25:18 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8ffbdb4sm23309494a12.52.2025.08.14.02.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 02:25:18 -0700 (PDT)
Message-ID: <7813c237-241b-4f09-8948-283def984792@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 11:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] soc: qcom: use no-UBWC config for MSM8956/76
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
 <20250814-more-ubwc-v1-4-d520f298220d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250814-more-ubwc-v1-4-d520f298220d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXwmt7CTTnN0vl
 vljNyyUtDLyGo3tV5B9aQfzSVk1tp1bvQoU/wF6/Id6109AooM4Gl9xK5cjyplty+bfiltNmpIz
 U/fHJQwn417Mltw0EMHP1oS/9RzsBklIaNLGBCdeQQexfL5su0bOeckz6DOoTnTmuhK3EVTWsFV
 n6SEd7nq93GaeKuXRRt1E/RPvT+pxKhCDtZB/CYN+5UcclXxjfxXF4ODDGTK0vLVvz5HxLgIQ6C
 yaPUdJucJZUblq6/LL85nJj07+0+FQFQ+E+qBGtzBPnrtkUAUmxVegN+hz5kFvYsyX5maOYEk69
 f7hBbopYqSL6vtUa3Gsy9hdIjZoB5HiffvWNSLZSUyl8I+y+HQX/cyMi6xV3fe/HGyA4UWu6slR
 8iLBX5Yf
X-Proofpoint-GUID: ljE-EkOm_b9iQwJFgLP70x6GyMoajrsP
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689dab86 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6H9nUlg-slowg9_X3SkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ljE-EkOm_b9iQwJFgLP70x6GyMoajrsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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

On 8/14/25 9:22 AM, Dmitry Baryshkov wrote:
> Both MSM8956 and MSM8976 have MDSS 1.11 which doesn't support UBWC
> (although they also have Adreno 510, which might support UBWC). Disable
> UBWC support for those platforms.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
