Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34860C83884
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 07:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A1A10E34E;
	Tue, 25 Nov 2025 06:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ot6/TizF";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDsscwJs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19ED10E34C
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2geeF1939548
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=uka3uTpmYpZ
 zlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=; b=ot6/TizFawuhqCorhRmo/gQyZj6
 VFo7AI9lo/yMIhbdPyB/S+xbkrQrg1giT+G6mEEZCLmmjT4hgvpkoF+qyovlhFAa
 IH518rDNSYr41qi8eJpzaYz0JfCjQEsDO2RoYoKVR3NEvBk72OHMqsP5Wgk06ibr
 A7D91rDIGnLI30PSXji2rBcGo4eB5b5ql3NXiNd4TlWl9DkM24QrEG0HC9ldISAn
 NVEZvp6VZV+dVbZA8Yq3Mao26lE3miXPeNLg1ICjoamPGk2ArZwED65uAzKAk5Uu
 BDqwwbE9DV46QfECcH4pyzHquzUbnLlOg96Yj9i2gN1kLLqlL5G99/1TQ1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsst2b3h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8823a371984so128095156d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053316; x=1764658116;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uka3uTpmYpZzlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=;
 b=cDsscwJssRbmV+sTyOs5Zm0Ixyok4sXV6JFzJMfK/n8PuG2d68tB0YZk9VihOTVgK9
 Dx9tWaua7u8lBHl+Tg7kGmLTsDWRDIrUBAL7wCPVPbeWx00XIYCqbY0nlWOHKnYbGD1B
 +b4okwpu1Y85h30vURsFzOWdVIPXsnjCiwn2mHWyZBe61ZRKUvkoUBClgHIQ+/mzZe/Q
 yjr24fWCXuBb1ifUWyhX8U0wZWE6kb2xHUaH6kJgvCzPp0yripadNN811xGwKAxByiBK
 ut4SHAP95v2bgMePBQBidduxDPv+0fXoARB2eqqdz5RLSF0vYHKVP5Fn2nHw0BMVqeuK
 sn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053316; x=1764658116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uka3uTpmYpZzlyvT3E47XTXFzCZQzB9mn0T94QG8BGk=;
 b=m8vCMSYxkeEvcLQVCG6eObqnyXQZDtdXXvQIY2tKynTW6XJD7IB/ZVjtlxdysfCiTL
 IlnhJskMObxqgxZQh57MmSRRC0kXHmWVEhdusi811pq1fT5+NMMtcUmSg6lqU5vcyiWq
 R/uvSy3PvyCMoz6KmaNep4AQp52G/Acw8hRkEomAsGgFr6usgG/5CeBjoonfK+Glm+uU
 8Nt/waP0QZLCE4VuIRlOUWgGMhxXShMgKfqf8o+5U8ulqSYLpuHsL3TKApyuIhXtb1D6
 Sid2Z93qbcf01FC7f90GZsuj2iy06eS80eORvTW3qFctT8tVdjc4WHbXhcL8fqhpvhGI
 ugBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSGJHaJcPnTGIXkzEibrScd71YwXGuHhzrsq+1Hk9d284JDSnGkkNRjtwMNmzt23kIEesHSaK94l4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNbNMZhtGClHkD0SUuflmt3kji2ZNvwDayfI7D470EOCNfKKMS
 aDG91QFcTp+2kPFURxphtaZbm7Avm6cYGoCMJwMgUw8WJmsVxEx0dUTZjMH2bYwCepE5gQrKBaS
 hrAypWnmrlhk8Ap0CuBLGTXKZGAzaF2mBmhpyRVe7w3eb+55IAZFetmOo0e4ESKJFO7qHqZk=
X-Gm-Gg: ASbGnct83zPrtAJpGNwL+pVDz//1nRRyk5NnEGq+wpU29HZjZrLwv8MXg3Z4WJPA9pB
 wMZWabD9xTWEs2302W2ZRfIsK9RNQ9BV7Gokl2ZQHmK6zpIA9TTGDu/rHss/yhWpLcbEiLtkWsd
 mb9KLwTo7bnjNf7hcF+LwN5muc2QtF6/K+ZVJCvUjStDC/Id5nJpof9h/hKnpVym4PCF6rDXZ0Y
 RGy3LVRMox50rrZoCKWojIPQoFFvaxk//5bY/l624AwcKk+dxTylldURF9NB4kRmXXfVmT1CPFh
 VcJgk9U0Cs60Ue4Yg/gb7FsYj3XI41qtgyh6VXcY+/w+pNLAQ/qZ+nD2KtznRoq24xJ1xaOHatQ
 fqDBjNzh9hG8CYp50tTbJLghyER/o42IPs2N6TJqR3ZTcvx54mfD6LJ1jCA2zU2N9FyR/bAM=
X-Received: by 2002:a05:622a:286:b0:4ed:62f2:8f03 with SMTP id
 d75a77b69052e-4ee5891e11amr213003751cf.81.1764053316367; 
 Mon, 24 Nov 2025 22:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Jw2MQLBvzFRC89v824DN/Tc0cUmEGvEmhJxMuJaT6Mxnhfg0N3B9zzancdtKnis4GzykTA==
X-Received: by 2002:a05:622a:286:b0:4ed:62f2:8f03 with SMTP id
 d75a77b69052e-4ee5891e11amr213003551cf.81.1764053315898; 
 Mon, 24 Nov 2025 22:48:35 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:48:35 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2 01/10] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Tue, 25 Nov 2025 14:47:49 +0800
Message-Id: <20251125064758.7207-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bM0b4f+Z c=1 sm=1 tr=0 ts=69255144 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: uIHBHali1Y4aDaooCGYKnB-LRRzeJbDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX6GzaiO1rOoWi
 HGDE93ra/hEMjl7EUHbVNNMYaRSTY9FNjcrvG/o5rpWz/H8uZq/b6NvUh3kdqrADwBp20lp6oEk
 TN+PjXI9y1c9UP+XONRz0uVVhc5kqqoMYRBUoE+/fG2naNnXXA9NgP7P1AqThZinIkXf9407n/t
 jG0yfuw5NpZCQZOqyx6/oTN3eJ3i56h8uQQQRQwv9RyZELDJXsycawDh+rGEn2hx3JwW0mgogg5
 WcPkl8KCOAgSFs4KvMOnxs0POjCDhOiQ4Q8zfNBKiT3quV+U2mwXyzx9N2Pp9VProXUoqxugXCu
 Js6C33Stk4UedCuUdN8DK4DiGV5UQPyD00xUsYjV3TNve5R78137mVtaGXtoCi5A/kNZ4ha0m7q
 unbfFP17ZqimSacMDtva030EEFKIew==
X-Proofpoint-ORIG-GUID: uIHBHali1Y4aDaooCGYKnB-LRRzeJbDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1

