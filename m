Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1AECE5174
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 15:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8CF11A5A1;
	Sun, 28 Dec 2025 14:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="epRBDnwf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fz8itGTN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F0710E617
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BR4e8mb656103
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BPfv2zycZsU
 jT5oCP1yDoGfm6asCBAPyv8E/KDYudps=; b=epRBDnwfuV8FWaKvtD9/woHaByo
 3noIpu6eQTTTeJlKAKgQhjjYWKxg32xGdFc+Gsy/xw6of5BE+a8uMRNd6/Upgy4y
 LzUw/pcRuXtpqJbisl4diqf+HC+p4iLrdK6KNl9ZHyPcrq3B1zWXzDu/v3O6LLw6
 9Pwh/ajKXVAhNFAHm603xpyOKlDfDsh38QLkkZdB+lDlryexQiuhzB4CZRgn+LXv
 AK3DliOM89myCw/1VanOGlZWD6OaRCLFDmFQJU9VrBcnrIPWG4h1d+Y+3l2gH/L4
 8M+OMXKUmgWw4P7UZ3vXm0eMDeenLxkBgqTw5loEUOtGaCGD6PSvJPv+BAQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8mf0cnc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 11:05:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed82af96faso162760811cf.1
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766833518; x=1767438318;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BPfv2zycZsUjT5oCP1yDoGfm6asCBAPyv8E/KDYudps=;
 b=Fz8itGTNYp/DEoG+vLxDbU0rYZydARatz1J7bWiE4hSmVX5Qr77cVV+vEMKcixXJYY
 979jiMsnG92SznktytMI3LgDOvR9W031IySzHyT1Cc5JtfYV+1i80f12PHM0oIEiFuFp
 xVXbCqlDOdQpnmrLQRAHif1Y2ibT74ewWVY99gpVeq49vtT9PazygMRr0IpuH4nzhCZb
 Jf2MNdNWbkVupizXLmlOnUrAu1zIaFpQpzNT1FPVeqQlW1iFcQvIdhfp+1LqvKTAVCA0
 q/6lWtyOZPqp88b5jZL82LlB5GpC5WbI0obk+f+RJnXwUWqUuioe5AN4EbyEmSsEe92B
 58fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766833518; x=1767438318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BPfv2zycZsUjT5oCP1yDoGfm6asCBAPyv8E/KDYudps=;
 b=fexCa+HsaPyTaoZ+rVOG+O44o4TvWMN376Wagv3d1zJq4Y2oU9jY3aa3PjS5VYlwWS
 5gXo36Vu8LpAinvFEsNXTeSfiVtkBMoQkOpX7VD7DUPQT4wkFE5d6rjKZcN/nZwwfPb1
 4GzumeQjcc824/j525ccy5xXGjk+swKlbXA7R7WVwB4qn4inrgjPQ8nsytjwQMqemU7e
 0YHPYsQqRFAvdVLRZ+YiooRQdErqGWxIDe8sGSMu6ku5cb+H0Zd4tpX02e274XDT2FVg
 Brx+rMUlR2007eY7zMnm0HjdNvBoZVfvy3drjm+xZGnOEQ9p5jN2JzucYMTMIpR4tiqF
 syQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe44eB5OOwkjo8UHqYrPKNWLteZ6Ui/8+I+wzn5VeJ/+9bkzirOe3Hu2dyr3C9H/5a3eYrtQGonns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0VnH+LevCIbAfYYrVrPKKAF2cKfinq5th+7dAyipN0WRLKiKn
 NLg5Il4+M4LY/RPXERxe9YqYBcQEnqC5/wrblVmOULM8jfocH2s4XOopFlXpFomw1OM/SJgt3SW
 jyRNqSyqGrqZP2vBJnh2qrEd7RHk0tWvb08rTq1iQPqfhkQUgt5E6VCnNZw6M1oI2m8d53eU=
X-Gm-Gg: AY/fxX6e8G9E9I3ZIgBh1pRJvEHI+WSkhEnnPDRvlp+JV7V8LlZyMPY0miAySK9engr
 v1pctKv5TL5jNsr3ms41tfsOZw078DIUhG2/qRntC1UP90PwJAjNXuFuwhHp9MxcmFYLCV8VAEr
 V3/8ylGa2xc9KT6CCOrcMGW2Iik+3O9KV6/iAYkh8mexGivkbTfhB/dwhzV537i+AZAZn8GE7Hl
 V6kBZHYjSY3GfBb1/mPZdQKBR+Vw0QjPIFigbf91MaOFGo8pefUdIdpx88TGUXXr+splAo0w3Q2
 yIa8McQ7C4sgaN0vEZmgnfoasR9cWeoJtFbeEYuCQ7ToRz7zDW5lgX6KD8bhLkP4wlxQF4Bvm85
 eL0ZzXfM2LiDXMG+K2EZbViqu
X-Received: by 2002:a05:622a:1195:b0:4f1:de1c:dfa8 with SMTP id
 d75a77b69052e-4f4abcd865bmr383465161cf.19.1766833517967; 
 Sat, 27 Dec 2025 03:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHvGvRSyzq+3qUQopeLslFpXKkNgnVyM1Jsfx28ck1r6pgHr/0bBLCofpk1Sy1bs+bbzB8hg==
X-Received: by 2002:a05:622a:1195:b0:4f1:de1c:dfa8 with SMTP id
 d75a77b69052e-4f4abcd865bmr383464601cf.19.1766833517481; 
 Sat, 27 Dec 2025 03:05:17 -0800 (PST)
Received: from quoll ([178.197.218.51]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830f3sm49080283f8f.22.2025.12.27.03.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 03:05:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: display/msm/gpu: Drop redundant reg-names in
 one if:then:
Date: Sat, 27 Dec 2025 12:05:06 +0100
Message-ID: <20251227110504.36732-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=krzysztof.kozlowski@oss.qualcomm.com; 
 h=from:subject; bh=l/WIpoT5rL3gAyOallcL5sMSQzwxVeXAzYzBpvRRWqI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpT71kyaiPiKFe7xEVyVYavtc+2vx3axBv3bjKc
 RVuwZd7ZreJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaU+9ZAAKCRDBN2bmhouD
 1yCfD/0RWSo7Ulp2JX5p9iSdlRdKoLypBJ1rR5PDv77wXQppqAVjt4sBgBaKPmmJML0bhqedgRP
 gDOJ1HwJDa5VyZtbIjVqvPNjKKgNIDrXi8CTak2hRiaH9mXaAeDqudNmNYV9+WmcmPjBQ4cO6+S
 7y0CjUM2d2oPf0/X6IfuTdvQNfmpzijIpHivwXvRZKNyTQQTHaaFPWJE4zv8AHSLqZI4H9jWubs
 Z4JhYPSdWaLpjrZID5w0VRVGuZ/sqN81j8MqWmE0DoAstAS6NHpG1oLaV9nF9fEaNNzKqRV7SBe
 5d7RespEW8NRsGaYvS+VNNV1qAPqnkjYSQPtySGi0XHK20Pnda6kgYm2kedru+IREXrZHR1FAyc
 tNbeB8tFXGl/UUtf2zKSwrv1LL9U9muVEkT90IiC0p4N2pIaOojPq1q3H4ngW0ZuBGPG3eNw71n
 qv/R42sYhEDsbpMoFtsb90H8Sv9yzuiVdzBMck16KlGsF8aHAi7m6RiuTldvDAh7p7N+BqzmCIz
 d3UXPg+0yy/cIs5by3rxU2C354NDgnJaRpfimkcitx85ghOhYCMe4cB8RBe26yYq+OgJrhUdHgV
 mQlyuxJIBoah8BI8qLvTcDBr7pyiTzw/hzWrLJcBH3yjTaYcvyEErdZTMwr+HxngP1CDhryiM4+
 v9eor4qm4Yqlxig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SBsr-WicpNJGvAaEKkZR44vwIo_j5mzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwMiBTYWx0ZWRfX07M2m5h8/QTq
 LAlshtP2wG2FQ/rgRlPiQCJCB1MZYWA/gykaV6licML8XmlM+HRq8PKydjMaHRQy8twzM7QGTEm
 TqeJcJwjP+5nad2phNk0oW+K9ehj6vvHE5004YPnZkdoHOxnsC//wtfLLkqiVpIYouEiNtaOV6/
 5qIaNpSEBZpUPHaacggb8BspBgujryHBt/EtjxoAhv0284b4YjI424pQsfYc2sVduZWx/uH3nas
 6XD6Gtmv1DcBjqiV5tIarwZpPUAki0ICDqGw/FtwMAQPWsAvB+AiAvo/jPUgTL49yuoUeHH8Z+R
 V0oPcUaDL8/07EjooNonsxm3DNyzbFRzz5p16R9/q4S/ZwF1DbKoJGijhGjlTXsf1cOgafY+in2
 kqqIHZopO/7rnFHiJDfxIDWNhiLRgEBzMtx9LFE2zupYhKAXKgdrsKJUfdHZOTRI5rAUj65mjJr
 EBqUkahVTlWXfo3Bz9g==
X-Authority-Analysis: v=2.4 cv=XuX3+FF9 c=1 sm=1 tr=0 ts=694fbd6e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MCV8vPsGP35s7PfGzH4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SBsr-WicpNJGvAaEKkZR44vwIo_j5mzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270102
X-Mailman-Approved-At: Sun, 28 Dec 2025 14:45:41 +0000
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

Top-level reg-names defines already proper order for "reg-names" with
minItems: 1, so no need to repeat it again in one of "if:then:" cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 1ae5faf2c867..2e916309abce 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -402,13 +402,6 @@ allOf:
           clocks: false
           clock-names: false
 
-          reg-names:
-            minItems: 1
-            items:
-              - const: kgsl_3d0_reg_memory
-              - const: cx_mem
-              - const: cx_dbgc
-
 examples:
   - |
 
-- 
2.51.0

