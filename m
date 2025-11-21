Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D68FC7BDC6
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 23:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D988310E90F;
	Fri, 21 Nov 2025 22:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kH7WqefG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csDaHp/7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB1410E90F
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:32:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALKxJIZ2756656
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Pr453cERSmy1/J9J1l2SfVrp
 0cwlN0LwGQ0VuFEXJdQ=; b=kH7WqefGVNsFQj+gaR6mLFWKT1rqgfx9RKoagdyk
 MazkSWDV1TldXVvbJlvNhfQBaB2vAPc12HMsrllpzzq+C8U+RUTkfUTnfcSFW+7g
 ChHV8N/1BDarRlqSM1ql4cCgubBG3UqqAVRxNZU3HwVI55608t9MIkoYZVe1GRoJ
 idSLZpxDTXVQ9qsrghEqbYpv2vBrcfCkSXzDwZvay8oJU3usYmfNOwvKZgLnTMYI
 JnCgv0B/5E3IYNCapvMfwJ7cOe3B+mS3Jneg5jvOw5IkClAxRRxUGAWsUuC7SWaE
 oBldQ2dUrpr8GUTtyQQJg9ntnwz0GonSLABUv9EB2p3JYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy6341q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:32:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-89ee646359cso745272385a.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 14:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763764363; x=1764369163;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pr453cERSmy1/J9J1l2SfVrp0cwlN0LwGQ0VuFEXJdQ=;
 b=csDaHp/7Ehp084w5eTL06Yy9x7Cm5N5n1vRazoGDkhsYDw5v6JC7ZIQ3mN0BW+Vsmq
 EWDSTnoItFsOyZv+E38XaiIUztbt1b6WU61/XWypPzAl7qvMVzmifvtoFY9rxHU6sRw3
 50hEIMpB4qSlMxSbx7QfRs65hgcAROISG6zPR5SM/Z4ch5VUa/3QBIm3Aaug8EWE33uO
 iwGYKU2uY2Eia7BlztnfhoXdmWbZU9G3rSLRWC/WHNiMp+Wl+MUIl7FvwMnIGojjJAdD
 H8AkncLx5nBApMmQDVfff/86ICBCMImUvsJoCPnwM2I0bfYgDrVWceszacxqX/x/bsgU
 IU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763764363; x=1764369163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pr453cERSmy1/J9J1l2SfVrp0cwlN0LwGQ0VuFEXJdQ=;
 b=eVHMmCIXOP/hN3sIGBGAAwjpQhSOFHlvKOoDXYF5WSLclIGQHm9Pm/O22oMYaTV+3H
 7oL6vuSnJN6YEusi5pK/fVPNzP9vx2H0GqKkO+zPMmJFWqUdsXA1ikn5Vr6NZ4lioRmn
 yp1+csiLOlhoYCCHpskK/g2jcAxPfyluhZcarVTyB6eoMioiD7gXgcVGyaXPt32EqASF
 evokBYU2Vugs/cucawHu1rJMrkxjluy0BlJhOw+09LAXZrxe2SQyzxS4q1AdW9t7knGK
 v93vTTHcJZTsgZNnkkHyNGpam1IAtT6LzoWQsl+CmQ+z5lQzrqnRxiX0kxkeo0J4JI6h
 myRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJNhIyQwaffzoV73yGN12P02WMe5JE8FlYNvolg9z5qHOEBBm2NLnRrDZsIkzu8E2eTY1Ifk8GJoc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxymswxoQO851C9IKtFz+AcxAQnX9ojdN4IfhDqd+44d9VBU0Ao
 Se23oCkDSjXJZIXw1BXw8ep5jycCdUSttfaouRyCju8+JNNRrNdSUcT9ZrwtnKtmoY7zB+hoP65
 v0knnbwbaWOAf6sgWlMsmmh7cC1XMl4SZRScOQRvuVEjjaFLf/NIWLmz4yA5ugccBIiH/fy0=
X-Gm-Gg: ASbGncuCNNZfWB5CNGPMslqT4DcjPM97BlKgOFCjlfrxJC2/n68o3O7Gjyl7P13WL+b
 DXYj7ki525QPIh+VWS08poivxzvfJp+cE5OANKGiuRd8vhmw7NEN4HLRw/27NhLaLZ2avrnPUQs
 v5sUE7XBdiWrqmOySlQ253ZVPQMl5sm+GTEsxi/wHvcAdArTvZjMUD3fARJDyhVJMzWKXvjC7Hn
 j18YsyQywdym2QWIRXaS7tuMm+kYMt0ORdbajX2Zmx3OV741on4uUIT+/InG/wcjefFZYv3ccB2
 A6AwUsX9AYYJL/yMuBXfqTtcbwwYy3/P955absPFneXb5z0HfFEHYcm5DvWSttKYRF8J03AcdB9
 846RivZ7VTCuoeyoGoMOdIWdj9jyk/DOShPxLwmAsi8u/U+ePIUm+tOEZzD2mOH1jWQc9uMhr5E
 6wyN2nPs8Md6YD7vH3t3OoE/M=
X-Received: by 2002:a05:620a:1aa7:b0:8b2:bf20:f0ef with SMTP id
 af79cd13be357-8b33d47997fmr497572685a.54.1763764362829; 
 Fri, 21 Nov 2025 14:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrQuCX6VXqTt+aYIlduBf1Y7uPpB2QJUvC4Ki9sjnl/6lrwFmlUsH69t4JWc63uH1+2GbDVg==
X-Received: by 2002:a05:620a:1aa7:b0:8b2:bf20:f0ef with SMTP id
 af79cd13be357-8b33d47997fmr497568285a.54.1763764362337; 
 Fri, 21 Nov 2025 14:32:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbd2817sm1914260e87.100.2025.11.21.14.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 14:32:41 -0800 (PST)
Date: Sat, 22 Nov 2025 00:32:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
Message-ID: <7dd6deirm7p7jgbjzev2hcxcfmsx5dtijfaglynmqaicpxr7rf@p2zev7mayq6l>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=6920e88b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vqXn1OmANuNKE68eGBVXVmYBxBJr6PZ-
X-Proofpoint-GUID: vqXn1OmANuNKE68eGBVXVmYBxBJr6PZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3MyBTYWx0ZWRfX8P2QyYVAVYNO
 SjlhrH/GzHNQuao9QTEhzafngUj6HKCmzH9E8LRo06YZ8up3+wTj5HeTE3rBJvp3DrYmaSKfsvx
 nZ/E7tVOOrSY/zai2JTeO9zDABZE4utaOCXFDLlmw8xJBEunqL8kVjthQqWjUDEEGApSSkcV22V
 Tbd5yVjjGHcWyxEmXaf/VQfKNjdeYXkWLPknLiqtd6pM5NMMMM3R+0TOmPUgi/WGvf0m9pf7C4Z
 tySqK1vjDYV8noSAaFO8DEk+z9nRRoLb7LczADBZgmOpSXYfu9KH19G8eeXSRqOmiIqTxu5PZga
 ffblCBZnjDl2hMMnIJGTixnMI02YSzyxm1Y2mN8SnPj9cqJhDuIgypQYQIfGozJG0BxHPGwo0Or
 4/s9HNvazngHRD5wpPWFB17MOwLSDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210173
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

On Sat, Nov 22, 2025 at 03:22:18AM +0530, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
