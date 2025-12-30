Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEB0CE9E2C
	for <lists+freedreno@lfdr.de>; Tue, 30 Dec 2025 15:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B73410E8F8;
	Tue, 30 Dec 2025 14:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5CqhybS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BSOXvBhk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203CD10E8FA
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BUDHFbD3556151
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=; b=c5CqhybSYs4lu27D
 BL0ATI7xRfF5THO9eETo0uIn9M9+EHPhSRv+15qAisAZ7XVA/CiHc83nJO7+Lx//
 iB0qS8uMeOh+ffFPrZg60+13q4/1eoLvol17wW6n/k8XVWxxqdJNgFQJKyMisOy2
 xezZsjQY6Ycu4d4fF+yzEBWBeilpf+9RE3NrNXKzY1tAV5Qlt9LhMPILXqveGujR
 ngzLKPJOn37ks6UWPg3NfH0e29mQqOR/CO36cH9bXDHL+/nvdNgbj2NRjm7Fv6gS
 XnP79OQfo0wQBOOzFOaT6m6t4Xy5HsFx1WWXhAhyO4Xu1b7HBIrg1fKTv1Bh1vq0
 XQC89g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7461c5r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee23b6b6fdso25852751cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767103927; x=1767708727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=;
 b=BSOXvBhkWiBggiVxF+dPxWGYNdOWaZ5zDzPE8cqedawe2kiGDunl1UyOoRmUbXkC7z
 qmfMFknAlgitaGOjqvGPcoo9eisZlYXImitCibfsiOhUZjfuNmY2f1EG1bRBdxaw+0od
 Q8lR7/oqF7bP99COyMiEMJBrAsdClLux82aNPkdqZv0dK/YVrHxOyADa5RAIzoPI11fT
 /hk8H+VCzB/6jtpqQCaapNHCCp1leIs95n5pQY9t+OoxA4lzpKMVWCl71RctzBlBhni7
 rHowZub7E545AIP02KT079g/cOE5kIZT1xm362jZRG07T5CN8UwUIi4PlrcF8u71g/Ab
 U0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767103927; x=1767708727;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gOS/6+DACahWk4IG+foy9m4YTOOq38wbloAXw4QG9DQ=;
 b=cJdalUD2gkr3gLhLv9BHWlYSwVzPJJuF0HxSxKoQjnrtpfIXxfEbf0nnXo5OLYlTh3
 f+P0M49Nr4+LI7vy1XWcMVW9Ll1WtPrmbhpPAo7mYZ6ld6i5E2/IBiPLbDWTfK8TEU8I
 cQkI3M7tmCIDPryMl845EPaB0ffwWodGyOZ6y9irOZ13uXZ1aN1kyjELUv7sLQ4rcbq4
 gGULdWGVJGoL3IQXakfjc/+ARaYVLV0eKaDOKsHYSGJFLtFGdfH90hDHQf4bmv3MS3Pq
 d1SEY1pSJvnobk4Et3bUZ+vKfLgoNqrL/wrLBCcZ1UiH0XZUnGf79z1F/aBbVPD2gJ+S
 8mKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3ADD0tXud3YrcXpxJnz9smfe4sXCfpN/2mP4AizTGDM+E7fsBBz4uyFyp6HOAbSVzMgidlGw6WUU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFukhl14PPiBorKAtAL+6+m9+cGFmGJtxsd3qCLcsCIAWyTkx0
 hdlhT0VJnfdTlAkZQMDYq6J1YgaJ6qjqll/mVwS8m0LJ2KNgGQ/WaGXavSh9qYciw6h4fYTZnhC
 GQKMn79epVHyymEMWmjNXPJUBcQjdZTQjcjmRwZevaNVIohFVGpcFsNNpSYX7ZVNud6Wgu4U=
X-Gm-Gg: AY/fxX7zW+hVbIKwss+eXAz1u0kw/i5HEKOt7xJ2v1wckcd5hLVUDFS4W7BHbBevIrp
 AzF2dnd85+dXooeGLraLNhejQoSyHJ5MKjzTz9n51oBoJc06X2JXXxq8Q18trOhleKbCzbUfjid
 Xtl0c7dh3INF+mclT7R/+rab6u+JQfGI339vZ1w4imDwBcqVhBwUavQWyihPC5G7iElOx9R6t3W
 Nd6w3TQ3fKi35C6lphfVyDRbu+WLJHVt9r6oWAW/fKJ5H83aHWJoOm/XxOBnWHoxF3VBZxbgdPL
 snjsFM7GxUmbMmyoML6CfQ9B2zil69n0XvSJBJVNjynlD/xDjZQjp8qdzS3ore/Oi4Z31zSseVt
 C/9zvKMz2aS5mLg54KIMtjX1KvKhf+2hEKD4+eBkqQ9m6pidDCJAKteVfcoItAR/33w==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id
 d75a77b69052e-4f4abe04451mr344777971cf.11.1767103926431; 
 Tue, 30 Dec 2025 06:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjqp9PxLRQ/4vjh1lhSfvZgUJ/bKmJeLnU3Q+HtKB9o/HKRUhKyUByzv3/wHYsWz7jfIc6Dg==
X-Received: by 2002:ac8:5a81:0:b0:4f0:299b:c785 with SMTP id
 d75a77b69052e-4f4abe04451mr344777461cf.11.1767103925985; 
 Tue, 30 Dec 2025 06:12:05 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b830b5fe8cfsm2133862566b.59.2025.12.30.06.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 06:12:05 -0800 (PST)
Message-ID: <0d3e5f9e-b9ba-4c2d-940b-de25ca8fb208@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: qcs9100-ride: Enable Adreno 663
 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
 <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-4-186722e25387@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Do9bOW/+ c=1 sm=1 tr=0 ts=6953ddb7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=be7_MNJoD_q9xFtD3CEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uW28-WESdnlfwRixF2hJp87_3UM5Y_ro
X-Proofpoint-ORIG-GUID: uW28-WESdnlfwRixF2hJp87_3UM5Y_ro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX3x4tA51VIdvP
 XEsVPzcX3Rg1M0dAiKgtRstTwJwZZG0Xp5TUtuwJwmlMIMFP3ty/wR8hchnAABFnFvBioy+h5wU
 tfEOW/6yTi/41RK7+yDSFExsiuMhYhVR+laQ24w4CtR9uioSMzDC5pzA9Cg82UBLwrGq6Ye8gQY
 UAjm0dWGL4KdMVh9ExCDfrEl7VZU8fgArOVVh6Z3SPG6tP771w7+SnYq2OSVSwJ6iwvRd8zjqQM
 cZPb7jZRfwpgT98kO/yoN3tcpwmWKG6ETN4lYQfQSrTTKraF8sS+hNB84s4qc3xAcyMoqlabiu9
 xdH7E2GZ4gcUeSZlbhZTvoHtZUppY4gERPXq490grUPg6odEZm4d5bO5kg1eUSAwtFuTQVIs8Gk
 G2mfvUm7k5qPLqKWCJg+j+r6dsuD+a01IH3Up4HjF2bDnuMoG4/2xBSc8btsPbrW+N2mZkgy3V1
 OTDROSgQnmKa7kUhZUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
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

On 12/30/25 1:33 PM, Akhil P Oommen wrote:
> Enable GPU on both qcs9100-ride platforms and provide the path
> for zap shader.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
