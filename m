Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07B6ABB2BC
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 03:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03A910E208;
	Mon, 19 May 2025 01:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctYcmrJv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA27110E212
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 01:02:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IKwRDt029025
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 01:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8STRhgSicOn7j6XQwcVTZU7Y
 AVnVtOQI5907glRUH58=; b=ctYcmrJv9TFKbLahfFb6pG/57Y+XEF4KgOcCtgjQ
 eN68rz9yCh5qYim7QDWN4fsOAoi6p8QKNREIYbsQVjUnn0v/jqI8gT1nAKVtYE/+
 3rlsQpTi95yrgVhAb+tHfILZjwfKwbl9lGPucJwmuoPncbRZpa+NauvM+s6z5WqM
 A/ND0PGtCS3mzkr2i7o21LnB9zVedFBGUOt6SFpATKsBBbsk+102khI4iTLBMwTJ
 mtc/O/mAnBZj4jYf2NGoxszSN/xDlFYHcGPRmuEXyof3Dm5WJK6oKjRQCxVoR20d
 i5/3qlUDyn8dG/ClsGkZCyYOmObZoyzMWjaKmF9uVoB9ug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4tnsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 01:02:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f2b50a75d8so60686406d6.0
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 18:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747616538; x=1748221338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8STRhgSicOn7j6XQwcVTZU7YAVnVtOQI5907glRUH58=;
 b=NTWlaphut3qnfFcrV8Y7NCE/yaTn15TbbpvhYR/A3Ic6a7BRh3V3w9Utl34T6M5dMR
 qQs6GDWI9413LKVsbqNaQOrbxIPtLKzq6qo3ZrQ+BFk2QCMSz8D2ntnSGFJs/gMV7Y9t
 9S/kvRH4WTeD2B7laaNTxI7WmeViN7MU/maeWL94jsGZRHkLPrCEkbXjx6rZd8JDqxlh
 EEsp8ryAms7Geo4Z1fQxVtAVfBGvDC6K8fb6aJMFsjZXEDy6cLEUZGFFMapX4pluPTyg
 iaje64GdVdqkuj8KKoOHvgK0W1KNHUBSI4q6AJy0hUUH18tNlMXmD/kdcF8pEvQRwa6K
 Kk7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm+3dsFnfiFhtqBXe1O26bHM64vONZvAqPJMZ4+gfTL1CiiirIjqrvdZ5XldNJ7+HdLLlHSMaIthA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0OZQrdVvRAQBKFvD1I+6Aj9k57lL+86r2SfLXvWzLPD235HXR
 FSmWB8MCJWvvVNp9Etn+e9Roo8OtWY+OvbdN5eT1L+EDSe8Q44HAuya6DNKAJh4iYvJ8+vM4qxK
 VtPFYLgQbi7BYPl7wQy4WRHVB7G5aATz/dhrN1lMSXR1f/0rrOrwldc8P+6nv27Gjo/UYK6I=
X-Gm-Gg: ASbGncvFqDewzc5YidySPFi6lu/Y2kwC48GVYjYzMe8dTwerIb+cOywVLOfM/okvaM1
 Dv9uXHAzb2Tqxqk4VNiT4vixY0wO4J0gcFPBSrHZRbSD3Ndl5HZvV3dx205OZ0FCubmgYBo5Tu5
 WHk22fn88PeIAzP4aBIZlmiGoWnh3K0nHTS2DPuGPnSi5gBGIQ0nlxMcsMrcWQI8ADstiARKkLS
 usg3t4wGvNw0lyvEg3TMkXpyKPARO7PJzd9p/jltaPRjnprp0e4ur3FHz0P1glq3iWeh96ynmoR
 c29YUspu/zJb6/UET+00dOQNEKFOweoIvUoCXfJhDe3tUo+tkY6/AGfs/pw3CbNS2fDZzbzx1C4
 =
X-Received: by 2002:ad4:5f8e:0:b0:6e6:5e15:d94f with SMTP id
 6a1803df08f44-6f8b2d4fa1dmr164141676d6.27.1747616538242; 
 Sun, 18 May 2025 18:02:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSWo18mdSvwfxieffjfuvn66T/nACsrj+CCnE08zCXT0yroo0DlXEmo/fJG3GV1JDhV9D6gg==
X-Received: by 2002:ad4:5f8e:0:b0:6e6:5e15:d94f with SMTP id
 6a1803df08f44-6f8b2d4fa1dmr164141186d6.27.1747616537857; 
 Sun, 18 May 2025 18:02:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70404desm1625222e87.252.2025.05.18.18.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 18:02:16 -0700 (PDT)
Date: Mon, 19 May 2025 04:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
 robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <mlxlmh5zswt2n7jcmqvyvgiif5c2ch5gb6yq7ethh52aluo74t@ruxhcdvwhxbc>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-3-amakhija@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513102611.1456868-3-amakhija@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682a831b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=STMA3DZVbMtk4X8eXj0A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QUj9oXaxeWP0b-F0gZFoguNZmUPrRB97
X-Proofpoint-GUID: QUj9oXaxeWP0b-F0gZFoguNZmUPrRB97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfX5Gdsei1WQVa1
 fuXGjyb3WyN1+bjzIjFv5ADHdSpy0le/ParNt5wvv/8Ay9+LZ0Vfxr+zGsix4hP66NDJ5MAlqlr
 ItOny+cSB49/8h5Z1WOz5DYsr+S3w5i6iXtWNyWjI0Zw79XnAOOBzH/NsekXcjH9vAqlAdTfUXh
 VfGWPADmzSfjL+kOBE1Ngeh7SdApiH9BsmGcS3cGkr9ZJzbnm9NTb1TPQoP/a9vSdDIH//lHQb1
 i5MzfzOCUZRaDyc4t1TBbqX2TJ0s2js6N2ShXFaXOiWIr9Y2zOY6ywEAXvY/O0tgs0DdotHcOIf
 INi09Tbe6XhXEOFOWG2GPbChpI6X7KkxmGCWPIN4qjpeBJLHsG+4f03q6Up5+QaEM4aHRh8FqcT
 saNr7et8dOy/C59IN0+TQQl0vmBE2eAqmgTqJy5gsmZb7C3RQGhi3JFCkA8RDRM51QiUk+or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=788 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190007
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

On Tue, May 13, 2025 at 03:56:11PM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 232 +++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
