Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF4D07DBA
	for <lists+freedreno@lfdr.de>; Fri, 09 Jan 2026 09:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027FE10E819;
	Fri,  9 Jan 2026 08:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTFN+ebc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvjQza99";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E1010E810
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jan 2026 08:38:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6096cPa61953482
 for <freedreno@lists.freedesktop.org>; Fri, 9 Jan 2026 08:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXR
 gMeIKMe8=; b=YTFN+ebchL/FAJkmfL6/p4an5Fruo9Nwi/vxyT5ow/TMJH3iObi
 GCzcEdl6xBfszxT5qN2kcEKiPseExgopt2EXU79jYz+fOZQhzsJuTL04gocqVRt3
 CjIl8PT5fqzntdLp1ojzxHnptjG78IgXElBZgDD120pz0vnwHGAGdwL7YmidcerF
 xxZNm9o15HNaVHtkg5QCEdS/MP4NWSfSB4yuV2mOeY89VEvdMLqecAS45n4mexjt
 Eo2LapRC77qOC+RurgQtXZYGX0ulqO/k2iMoD/qhBnIZVPxMaDRvKhJIGTb/qeBw
 NABziYK/KMse6ty1lGSmZErUwFiaOT21+2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaamsb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 08:38:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2217a9c60so888745385a.3
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jan 2026 00:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767947911; x=1768552711;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXRgMeIKMe8=;
 b=gvjQza99X+yEh2mXiIJSO04fdsEahX8K0LxGdYaRKppqpuGVnqeNc+0unB0b0lOMQk
 riAINt/Ekskb6zQPZlueRZHaMTWUSylTWif0c3ZUqXEwNGEeh6+UD0MjxMj6panxDAaB
 okyeO8YHoDaYHjwwJI9FM+rhM9vHbpATFYZWhmZI4VMXQ4RUA18axLncznGGB0I92jdS
 RdL0ZO3prwzoCOqpto5oFzmVHGwN08F7s9j/6sBFZNpx4q8PrzXaqOpD/994Y+X4cbNs
 nXegm/5y4qgcDo/ibyfSgE0n0qsYXipeZ3z2GDfNAFth+7rLOWcQxSWLh829Obpz/129
 XOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767947911; x=1768552711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ab9wCYRkmov4ycBmObTVv+xkLNr5lZZSiXRgMeIKMe8=;
 b=l54jTe7yUQaOpZIcIXBoC66BbIrAyi3DiFmZr8yHbCBHUow10J9rHpwvgPTYzxuZi5
 oPO8GXZJYNGH57CH1BW0nYTcq6t7n6ROWU4G9LxZ/VDI4qh69gcOJU13oMb9p+KBfmz7
 gAqRlDO6KjhYukrkTl3IcIsXwYMLX594pXYu5cdMOVgy0gdTf3ydmfL8I6B+EIBOrof+
 AjhHZmE9cSrX4YGeIeEz04fMmmnAtkqpFiwypzQsTtSmCXcc24cCtDt9mIc9RczRlBJZ
 OlM2vGnMj4/xKaarKr+lavGyH3zI0CRmIzgfg3u3svMhy7omjsFPzRdQExHGWLIc30yd
 SfcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWUAqUO41hdZgnBRVgNVa9g8eUHLmJSDSXGm1YrOi6G7w/HlA9M+LlF6EBcXu58NAbwiy3gRfoXIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhHw+KTp18IcJM3+wB+gQR1/xCUsg5vSssvBjS45XQKV/RTaUa
 lbynC0Hrm/mRsEAmRHdDJAFu3EG+6AykNEfGjHKXwyaV25+g+WTrP2l0DKLMUFNHEb9rw/yCj/l
 bka5pHAjXvvRqNBvQEXxYLtXEjAqVc02uIIYvZlWUxDunR1k9gCnk+OGxwGw+bMbiqm0PSHM=
X-Gm-Gg: AY/fxX5VDd6nua5GuEA8UtPiLQ3mOafumLq3VIoZwiYPHBcB2e73GxVNOA1U1ODtG3Z
 Nv4h1EeHasuh8BRqSutL8me+4+stWJEEyCQJ61BUYR0JEZITA91b0NE56WzQpchv/KiRBVzHpIM
 cZTKRC/Qv5qy7uO1Wc58CdPPRMJOMA1We97N0LWmP77nKSeCMf7XxDxFD2sIjydpDM571a5tRbT
 oSKPiK/fDVZ1q/69Hi7aqqnvlUrxQdKP4FToi639GD0lnyuoLCuIn87ucSrwQzaPpzik3idFXZu
 AwO4os0mVxtf2PzIgodsVkNMVDJbbXluvAURt2VGmUyPBfE+vyHPw9m1YfZJkICx+YTkre2HnhL
 uL3TsXAcGSYMWcurKAAoGFOTQYbbXSDOx7kVswMxUtZZ4jvhroG2Q0Y2AxdXUkUDIDnk=
X-Received: by 2002:a05:620a:f07:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8c3893f25c2mr1163409585a.44.1767947911482; 
 Fri, 09 Jan 2026 00:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmvZp6qYc6nvl7QjoP23G7Tn8tnuiGzqnKjzAsBMKfKV8jYCRV9KKhnZzaf4a45tyoLt4qww==
X-Received: by 2002:a05:620a:f07:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8c3893f25c2mr1163407685a.44.1767947911053; 
 Fri, 09 Jan 2026 00:38:31 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f530c35sm771262185a.40.2026.01.09.00.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 00:38:30 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: [PATCH 0/2] drm/msm: fix mismatch between power and frequency
Date: Fri,  9 Jan 2026 16:38:06 +0800
Message-Id: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960be88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dKC2B17Pv8Kfw1TXKb0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9ag8DxzYrTOQeGnKOq7iLbPnp6UzSDUR
X-Proofpoint-GUID: 9ag8DxzYrTOQeGnKOq7iLbPnp6UzSDUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MCBTYWx0ZWRfX2fxJeXTetboO
 KqRg3jXSpeYzG5Gne3KhuX4qhS75XafzkU7RZpYoVGgNw6+PyMtyrFk2cil5ib3rCDtDpm0vKAm
 aPW9iwhH+mZYOFSRpSsAhb7ZYtnYXGhgSXIo+UW6V5ThDA2IgunijSI9J10lpvoywq0FX+Cpk+P
 noQ1iqH5psuIdgUFSRbilnMa9edUplL6iq5CvSNB5Pdue4RE8lM4tCS9tvPcRovZZ8SP5LCd87j
 cuH7wuy57TMlxZILlJXPH9SGYyfOjRgVdk/nsvGfkPiAtGtPcSdR3lYiSYeC7yhFop0uJoItani
 cvX8lC0G17kerKqeOknK6wUMqZXAH3zsw54aDa9m46Gb0nM7eAdudhlpX62Z1WxT91U5S7c1yfW
 H+gxlAokNZx10xu8jDXcodbPhiIg69qMod+MJf9dZlsoATviP2BwCTNmLBlNu1hFI7TmzTgwcJT
 sxj2helcG/J1L8cMKEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090060
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

During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
the MMCX rail to MIN_SVS while the core clock frequency remains at its
original (highest) rate. When runtime resume re-enables the clock, this
may result in a mismatch between the rail voltage and the clock rate.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Yuanjie Yang (2):
  drm/msm/dpu: fix mismatch between power and frequency
  drm/msm/dpu: use max_freq replace max_core_clk_rate

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 22 ++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
 2 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.34.1

