Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FBA7599D
	for <lists+freedreno@lfdr.de>; Sun, 30 Mar 2025 12:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D0910E105;
	Sun, 30 Mar 2025 10:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fict1UxL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6C210E11F
 for <freedreno@lists.freedesktop.org>; Sun, 30 Mar 2025 10:36:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9rghU006729
 for <freedreno@lists.freedesktop.org>; Sun, 30 Mar 2025 10:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fVH5lVnR08zuySJUeq+uoGrf
 ogdD6s0iW5s7dVDfwco=; b=fict1UxLW9xXrMeULzi7aTNRGiMCuVAdVu2AI9Wn
 CUxu4l7FL4W0EFMDbbXhPn6J5urF2TJrWPg9ZXdEMOv1j4FffzrXTFn2hcrRGSRD
 nvNnqa6qPxPf8I/BDwILE1Ndg9CgfpMbLv04a6Sfb8fDUAvbMcEbEN7vL3nLhtpj
 ENCOEW2H5pvxflIvhNgZvNDJnC0hD77ObAC2z4o9y+L0SXoHcVDm4/Aa/YOQVhKz
 k/TYfFO4Mb7BGxCMgYhNAIPoAC/NWcIfqaPZ8SC/Xbacvte86MwEbUHlbILZwqUk
 H2B5pQqDd5jd19wdd9ylTxiUzNh6GdmT5YjIEJAkyF10og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kj55f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 30 Mar 2025 10:36:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5ac559cbaso598302685a.1
 for <freedreno@lists.freedesktop.org>; Sun, 30 Mar 2025 03:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743331003; x=1743935803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVH5lVnR08zuySJUeq+uoGrfogdD6s0iW5s7dVDfwco=;
 b=t3A1hmJUVYGV4CdxHc6wixmzOLsOb2mhOYrmU/NbCQJHR2T60gWTEOSjZHaQCkn3dK
 Bqxp8gGAjx+se2IHgWWCnULbHVxVWotAcxwrNJtU3WhMFXeZil4JUbdLr05iSAYizgJm
 CiJt1DiOcHNz5d4lHcVBkTF/AUJF6C54Y7TpFQAHtjXLpL3tgpeom7PyenrQdNde29N4
 PJxuT/e4N4AB2eD2b3VWuVEyA8wlOAnlRHDewRlDKD0JYyRk+YqCSw1EpO6uR4SZ6RUy
 u3UJxXroltDe41hWHdHvylYis5X5RlGd29mRkDDSo7Q6bQv+DJKqfBX/Sm8K1ggNnFfr
 OpQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeDeSH6qvwwbJyV+mGdRQylbQqlPuNI68/KxnbHDGvmvSgqt+Q0br9uq7WrUzoet9sxVZC4hW8vVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIaJ4IBH1sp02B2P08t2ZAbc9Y5vDOzp5AyoKo4pxM+J0GDp8Y
 W81D5gfre1eWCxYx+vTrdbg6UKCvqD3MlmrajB4nB6pn9zO1/Cpzu/4HS7aXIHfQDIq1Wznk+DA
 EJK3OEji2yopzIhVeFYnGjWXmaTbYt3pagGUOYO3J7zWnPvUnB05CU/K6OUn7LMFqc9A=
X-Gm-Gg: ASbGncuQWEtuvbTbUrymw7T5dm75fthLQrgBJzAslRBDFp33IjDFZncv0XhVC6rm8gr
 ukf7/9EaZSqg/UzUERg+k8kAKmwK5HjLG3T3bsP5n504gtP7L2XDgs3ACVg2kr4b9wPCO0VoI95
 oDoGWkASdxQJXWHNJEJXKH5wLIAvkrZPIIHuxvn7npzANkOOFVgyedtEfp2I5stKVGVnhGGawi/
 uTEdRhz/g1r+kI55HnRzgOpBmOQL0cLeW+Bm3bNfnulykn0jLgjfFNEAaUMW7OPtFh62g6CUW4M
 pL4JWS7g6xw0+4O+irlla1HPVkJzRpXAJDsMf6rqK4QQkyJ9ocamDkBFT4yUiOJFACk44wr9XdQ
 PS7o=
X-Received: by 2002:a05:620a:394a:b0:7c0:c469:d651 with SMTP id
 af79cd13be357-7c6908950bcmr823934085a.57.1743331003106; 
 Sun, 30 Mar 2025 03:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBtS6gPnV+Pz3tdsrxXFX0gc/+BT66q02s4zf4BNLAjJe/IVitafLnQPXX0a4yMcsExGqSNg==
X-Received: by 2002:a05:620a:394a:b0:7c0:c469:d651 with SMTP id
 af79cd13be357-7c6908950bcmr823930385a.57.1743331002525; 
 Sun, 30 Mar 2025 03:36:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0959150csm848746e87.187.2025.03.30.03.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 03:36:40 -0700 (PDT)
Date: Sun, 30 Mar 2025 13:36:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <mki4de5adulxmmpi756bi5frnsa5yx2ng2vh22q7sz6ijsc5kw@oyvb5xuu547c>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
 <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
 <4aebd1f6-5098-4548-adae-843db8f45aa5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aebd1f6-5098-4548-adae-843db8f45aa5@kernel.org>
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67e91ebc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=UXIAUNObAAAA:8 a=J_IFRixHdDkWMPCtAZcA:9 a=CjuIK1q_8ugA:10
 a=bFq2RbqkfqsA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-GUID: Yt3HdnfixlFsKUMcnUGiXq3N63PYulVa
X-Proofpoint-ORIG-GUID: Yt3HdnfixlFsKUMcnUGiXq3N63PYulVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=853 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300072
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

On Fri, Mar 28, 2025 at 03:28:20PM +0100, Krzysztof Kozlowski wrote:
> On 13/03/2025 13:10, Ayushi Makhija wrote:
> 
> ...
> 
> > 
> >> +
> >> +			anx_bridge_1: anx7625@58 {
> > 
> > Node names should be generic. See also an explanation and list of
> > examples (not exhaustive) in DT specification:
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > 
> > In this I have changed the node name as anx_bridge1 : anx7625@58.
> 
> Except that it is difficult to understand what is what, let's recap.
> 
> Original code was:
> 	anx_bridge_1: anx7625@58 {
> 
> You said you changed it to:
> 
> 	anx_bridge1 : anx7625@58.
> 
> and now I give my offer: I offer to buy a beer (or tee/coffee/juice) to
> anyone who will spot the difference(s) between these two node names,
> IOW, tell me what changed here.

Ayushi: mediatek DT are a bad example here. Please use bridge@58 as node
name.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
