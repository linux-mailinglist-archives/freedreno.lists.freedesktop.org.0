Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C803ABC3C8
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F6410E3AF;
	Mon, 19 May 2025 16:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6ILHzI/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A760A10E03F
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:06:36 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9iobm005266
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pCInV1QBCyzl4b6q6TN30j8i
 Ig3ET3mzjESHX804HKM=; b=G6ILHzI/FXwbRN4wESyPXLnJftX77rHjbEO/llOq
 6tzTNktXbKIRbmyhExsSWNa1kCDmQLitrNK2bwNOhPhxYtrqdBeQViGonsL1vipp
 ZmwOxHeOk2IZa5pmkCpOf3bduSfB2uwCAsmP6VapJQV78jKcFBHmwxvYDRLZ2rvP
 Y4oUMhbD8rtzyJMlVp4PmwZeZeSbcKHLnOkhchfRMSFGTisemiBIxLTKGGLhFmz+
 ze5sNB9LnTJJw+vlW9UCJBW2DjWi6DqizyYg/CQNORc95BOni5p2NW7fkW+2TuZV
 d3ysm/dRaFVXCfLRV7v8J9EV3Y+eXvoNCsKsd++ztA7R6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vyda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:06:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c543ab40d3so728893085a.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670795; x=1748275595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCInV1QBCyzl4b6q6TN30j8iIg3ET3mzjESHX804HKM=;
 b=T05x5D30V3Z1DpW6CrNDugy0ZttxhOWvz0iMRH1XeIzFv5vHXAzN6dRhWZDWEqKQmq
 e8yOI/2ejXvYKsng/fTyltIqbAJ9kQ820vZH4rVhBxv/b3ukOBklhAGPzwPq9EaMi2dm
 AMX7LYeTDa4h8Ujf/zH/ApBYhtVf7xGjfQffS2MPsupmWGr0M2rkjX1wdy4ejQMjB5VN
 MuOJpUqX9pm9kYmVScQFuYZ7HLz52uQkuvjrfGj+qsWyLKyMwJF+L+FgzOGfIVoJeFWx
 fdwz2R3TqhsQ1SfuoYOkEGMcfrJuWYFi3cVKh5r6E+J7AWB2K7LYqNgRWXA9uqYtbfkC
 n5IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1C02AsLgVHMk2mUj6wXFEB2KPcn/6lVuY4f1iygG3vHL86pHuagh5OcBpwwthKlK5qguvFKz8faY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/01P27ngrBLJ4ls4m5n0JPRxec6YJW3zFLCVYzlu4aN63dRYc
 OpYCZR/bzxelhh8a6BmEtfeVKc79qo4rv3WTcH6BtvZkMhIG6Fp65vKEIzWznnWG/v9L/U4wy8Y
 uZ8iIwi2vDa2lfzybQjU9b8Yx/Xq0jdU3xaf4HzYP5ghwea6sCngwq5NkmVCeoDZk8ub9w/U=
X-Gm-Gg: ASbGncvud3HcSIqXAS2C2lXcm6ieoe+zmF8/4PmqR5vqTpUnvoFFqMlHhCRH0WDJ9KY
 TqUZaOofql4iPoX0ZJ2+QdEgX7Lgnwr6jq8wDqbd3wEts0BD7aX4eefrxv406d97SvhSgJloa3n
 QnGHMq2GWR8XHEbxBCu2wxozFm/twDffQJVqvtnN/UggLKyw1nt8ehqPQTbBqgMsC9VAY53u6ht
 oK1InV1xbrq7TBjbYWGnkbu5lHFt3S9HShU8gG1LcuFQlbtk2Km+MZ0HKrBY2rxCi45Yryyg+zL
 pA70mISMAFsEgHTNP+EGaEgj0YMrBv2UgK19T702VKTqzzCJOKMHyaXy88StA1F7KLI9aDFUxjM
 =
X-Received: by 2002:a05:620a:5e50:b0:7cd:5090:3319 with SMTP id
 af79cd13be357-7cd50903498mr1489186185a.50.1747670794626; 
 Mon, 19 May 2025 09:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMFw5Roez60YZW75hF5ZwRt982I58W/G/fp9+fvjelzz4QBS+enmm/pZaPsaXJOzOWO1lQFA==
X-Received: by 2002:a05:620a:5e50:b0:7cd:5090:3319 with SMTP id
 af79cd13be357-7cd50903498mr1489180385a.50.1747670794160; 
 Mon, 19 May 2025 09:06:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085ce31dsm19233651fa.105.2025.05.19.09.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:06:33 -0700 (PDT)
Date: Mon, 19 May 2025 19:06:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
Message-ID: <t5jk3gmv6gxy7fhr7nbj6wwnutylsgenhepae7im6xqn5udys6@65ysrfzjakhv>
References: <20250508-a623-gpu-support-v3-0-3cb31799d44e@quicinc.com>
 <20250508-a623-gpu-support-v3-2-3cb31799d44e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-a623-gpu-support-v3-2-3cb31799d44e@quicinc.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b570c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3Gb_2g71upWOQPDw1swA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: I8aVnSIMztDHMmGt9-1ZdEr2xBgTnr--
X-Proofpoint-GUID: I8aVnSIMztDHMmGt9-1ZdEr2xBgTnr--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX6dlqQxd1IXv6
 dU4JUzrlrtaNgNFJZ7vFMWNjOXb5MPAr+e8lPs/9Weo0PJvVvUG3PMGyY6r3zhfJzJ2HxgYRTMe
 k01rWF+Qi+QBagB5634HKWmAxN8gML2J93wd/9LHY+cpNSZQ9AurqKuIQbFs5Dfq4YQInO9d9qy
 PFvDEaftrPty07EMHtXT1XnPyPfNoMUR2+wYprB74C5FKGWsUDUBO70Yxctbb+XINBoOVIIDPVV
 DkfDJO9lezp2Q8atfsPiv67XRr5rJgcFViOany0M8zayLvhqRk7En3wwnQ4OI6BhxBgol+vxm7X
 mx1O/OETiinul/grphy2YxG0b+/V/iocHFm5E8y3RG4tkSsgRcsWKp8fGS6O66OFxxHJXkesmZ4
 dUAM7MB5BPNyW20Ul04VDZsRDXCVeLGRBIhyj1jraMrwapWFIpvV0YJSnxxf1ZjMfFefMKlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=682 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

On Thu, May 08, 2025 at 09:49:20PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 91 +++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
