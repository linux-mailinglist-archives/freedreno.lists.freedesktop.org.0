Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87C6D289FE
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4629810E229;
	Thu, 15 Jan 2026 21:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFamVdnc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQe8asV+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1895B10E7CF
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY8oK2673505
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=; b=TFamVdncmcNm8ThG
 3v3aaGVFgrxTO7VopiZrStqVvwa8H4o4foFB7+MwTXnAl8A5GcWxEPw6B7KZyXdh
 T46EA5O1Vw3Lk2xz+LHzuCcSXzI5t43IF9M7QzZYVwOzqRTnsA6V/pB1eyNUu0Sz
 mXjpQfN/3bpXePjDZH77rBIVKzkJRmud6K7BbH+bByk/JvNB4iKdwZxFomNsCAi2
 6UAIIdnofd/95OMzoY5MyUrGE936IgUyZMAk3P0SDgc77S3xseSqdEsNLkeXMS/X
 DQ7BI/u4S2eyJfODa4Ykh0Yt7FVYC1LRzZAQSoNpgok57pr+4+eUeKQPNc67p5n2
 vyK+KQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpyduhm1h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:06:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c538971a16so333494885a.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511159; x=1769115959;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=;
 b=YQe8asV+qC34+gxn73oL/F66eD5dey++Yfdbi3/hcgGgKW/FrVQ/d4Qp17/+7O/DkC
 qWxrvan75Z3sn20DMOwKWb8nAkig/oxrWN1GwKGJO72At4w3h2VDZaltLGgCWVGZZmY0
 yRAaBzV5uP+0/NOKpzSoinAuBGFf5BalV+mxXcQEAzdA2QKG114CDOioI47z6JU3gkN4
 zAfRzirAbylbvfptIeggZPPw0/wk+SK6Q9QkiIxgoY90DWzjXy9dW8FPQuAl1f2Dwq2c
 NBzRjvH1Eamnzz9IFiKRnUH56NQw+NT1kQJNaA8toTUkePklkxaODUFr9q1K4i8uG2pg
 dP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511159; x=1769115959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1xvDJAqNi/XjSB0Ms1xbJnTiHcWmVJrN6o3B08nqtYU=;
 b=pc7jWCuDUBtl0mgIJEF0itywuAcrxsi5vvuMfGHEYIuF/2fF8CGPBNTfeGJpa9zypZ
 lT2HfgVkXVgzmPMiVRtELDfi4NLWPekaUbnN0/iLcSkEI8eWjbxTVRIJ6KWegGaRNOpZ
 y+ARpsAfEMAJv4Mj6KkEWoEvMjTx40EGYEZfdXtnTKioJCgKnB4yeI/2hCrUAKtNj67Z
 MwKSP3ybOKWcXjg+nBLPha2eMtVOeIx0W050nwhyqQrp+W2nKUSX78BXvUmirW/k0dYd
 td50692NB6Mmae1xM8QCtZxzWu71OXVReJM97o+PZuyPCdmUF70TjC1duN+2JoqqLK7r
 e7Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZGEZ3EzPiuV6Ny2HoOeooMvu25QsQ+r+oLlqz8fHS5epf115escyfHvlJU6pbTzgRb9QARoUz2Rw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/q623rBsViWcYU47lWk3spZ1QXttSxeVjUBHacmnazL0BtJ8b
 vfei2kekoozPoSZv9ulaM2te+hPdArWszA4v00SQxJ4Ojo04ypq9gS9znQl26s4jOL5Wgm1tL11
 Pp5qso1ArEpPdDCstFC5DFXIlJdNiAz7As0SkGPBet6iVf9ArEAHC0duEtRSbFF0dbkw1atU=
X-Gm-Gg: AY/fxX7p/8FZKRQH22Hsvwk37t3ABkuYHnT06Y/1/3EiOdhqIGWa/cxTrowY+1dRinN
 BEMlzREAg2tmglkz/z4Lq1ppqCQmzUMutFybFiKd9ET38QSOTCe6drZ8Ers6vhVsRJk/lMLNnet
 TDk2SiUUJloGKYkkxD7YfAZV0UyyOFs//j4oOWindyETDMWsmgQjDRGqplFdCxw9u5I6ss4t4PB
 kYU69Y03ZPfWEZUuZD+vIjgq9tPg86WzQT8qdlFUFfyvwLFPgACjn9xb+MwHihmQv3muSgwzC4w
 UlamAqEmawZtKKLJuVVeizDNK+DjB2sN+UFs+DxHk1coKqUTt+tP4XR7csq4sGk94WqYgpy9Col
 QkXyXiL4XHpV49774E5K8MB07VVMeE+L9tq28oGWqcC+SIlVYCOBWbDcWfxLk04PUqYnlY3LDRI
 dGcvp86Kt+GA83Qr45gswhcaI=
X-Received: by 2002:a05:620a:4088:b0:8bb:9f02:489e with SMTP id
 af79cd13be357-8c6a67a12b4mr109693985a.74.1768511159519; 
 Thu, 15 Jan 2026 13:05:59 -0800 (PST)
X-Received: by 2002:a05:620a:4088:b0:8bb:9f02:489e with SMTP id
 af79cd13be357-8c6a67a12b4mr109688885a.74.1768511159042; 
 Thu, 15 Jan 2026 13:05:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] Add DSI display support for QCS8300 target
Date: Thu, 15 Jan 2026 23:05:55 +0200
Message-ID: <176851111172.3933955.12274071236835720436.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260104134442.732876-1-quic_amakhija@quicinc.com>
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX4pHvyWRYJhzr
 bfROUmEmQwCXmH07ApvCV6M4kUFfjIDwPSQzgWQ4IhJuOEefgcU6MSa/UxAxcEj4+jf4iEEugz1
 kKd83+sk6AjgRxaPExkvETCdxuSmtrmUqtnQx+BWhVtPXBsCb6VCfvX6Lp1SylRImWVcX9D+wUO
 G6g/marYRTy/WeW0AvfARLETkq6YK62r5UiNMLyxJ2qeauTgUWp85gBkRFZc8+mAR2Xo3ADGNXO
 ij/vr5u5yig7nBoqUYbHvsqs5o1u9/eAMOoCz0Sm1RwdxMW9KQqYZsmrY5Xw8Fw9dGvkYcIiq2R
 U/TzUobyGTnB9R4Jb57nCBIGrHCxAdB3kUgN6GytnlZ1MFqngWPi+dWLVEzKKQyrOPmdkDVTBaT
 WEwaSrAAg7/gCXZFj3TOWV3N9+6wmpFUofFqWbRbZY0bNcpEeF9z3tk1FDfmG599sa3/9XGPUOh
 nEfw4wRqdDIHJ4PGiQw==
X-Proofpoint-ORIG-GUID: qXfbZFsmkd2j7MRko9YQzqU0EeMAAowQ
X-Authority-Analysis: v=2.4 cv=NafrFmD4 c=1 sm=1 tr=0 ts=696956b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=s_x85DquI-FxRm-hfV4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: qXfbZFsmkd2j7MRko9YQzqU0EeMAAowQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Sun, 04 Jan 2026 19:14:37 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge port
> (labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.
> 
> QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied to msm-next, thanks!

[1/5] dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/969c948d1392
[2/5] dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c42973f92974
[3/5] dt-bindings: display: msm: document DSI controller and phy on QCS8300
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5aa414e5c78

Best regards,
-- 
With best wishes
Dmitry


