Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07BCBBD9FD
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 12:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E6A10E08A;
	Mon,  6 Oct 2025 10:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSyLqFuk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE39110E3D8
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 10:09:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960Z2TW010245
 for <freedreno@lists.freedesktop.org>; Mon, 6 Oct 2025 10:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bXYSL6RF+4InEd3ZqLPZ7ukK
 78ULLvWwWztGrXPi/Lg=; b=NSyLqFukvnIpuOu0VLpXrMUvszqgIVaaEH8fuVtR
 tWz55tSwDwm2jpHH1++YsLnANV/+mQiFLa9Ywznq/mBSdWVwcvlsf2rFgq0jMqfl
 Gc6ARMtgS+x5tAVeHlG/5UkpDokjLECeAJSEzBb4P3F5xswVzQYwsSoKwd+k2LDR
 nzl7KhZ/RidNcWa/n0C0w5/YqznBux5sMRFjfTNVFg2il/aUXJC98g1ai31NuLM8
 AQf8NdRIQvkktvAujGf1LL0hSICTipG5K0+jEJQJs7uDSgin/RaeGwTyav9+8mv2
 yVI8l6B32zzL6fz5TOyZcMjW24C/o+4CvytdoVb0VG1EZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6ufsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 10:09:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4db75c7fa8dso115109491cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 03:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759745370; x=1760350170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXYSL6RF+4InEd3ZqLPZ7ukK78ULLvWwWztGrXPi/Lg=;
 b=WUVtu+xJOqjTJOT03YNqeZGFBU8hXnbL05QAUyX/9tcrT2d+MPr2h4tjC+PhArLPo4
 Zf9qXqXnf1jd7Ei8Zr1FB+TF5YtEnfjTNk+whxriaPrD4cqyl4Ohesl9GxUdELZD1Ve9
 7Rj8qEYpMqp8FT2gff0vo3cH6tPTTNFUWAn7WPVjHIxVFQYohiUb06t6iYzbZDekBFCZ
 JROBWYvMSEQ4MMkKMPHsFsNHMStH/cnxwW6ABNwwDom/VJz/Ki1tVZO++Gj094yu1SI7
 Lagzq5FrxorLzAycg4gtThTartjr4Spr/g0ao1BdEPpIfIdql8c1kpxa0M/tFGZhPC1p
 KXXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmNTpNApKuV121J1jttQSxzU7MhBlNNh+IzCya7MgNutv7xAq2QyvRcmAXj4MGZneBhqO77wIb5SA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4jMkieHCGOsLfFsVQu/un4/ImRx4LoAZR/QrvnJ7d1OrQ8mo2
 3XMpn/tg+0ce523QJJ+bxKTLB2JuplUYFHPrmfHgzclE0DTj57OSlEhXi7RzBGUFRtIsnFWe78B
 KUoicumXWKg4U5WyWF3qkegckWP6KtJe4QtIfiXc28If9R2NskImdo0JRX7MJmuhClB3guv4=
X-Gm-Gg: ASbGncv2gGo11cdov1bODMMdMxRs31lL3/D7j7sDG5ZW12Oer4iGpcnM4KSc7y2Li+n
 qVSqK022cISwL3clgpRPrtYZUAb/6Ndu9pkWwR1O/31Nrn5OKhpW30YgffigOctJmjUL1QXbp3K
 v73CkmsLxO5y7yciYGrk4sC76GHwlLZ6wdZLiknryKQ+j3cMYSmEFsqFa0xJJlDidI8dm93ar4h
 EjFcmy1QOF19eLg5x4ce/35xlSkM5AO++R7QGz0Ywe5w+Jd+BhoZs0F6CIvWWpkj8+utTTYDm80
 CC8O9WBfnCXXSfqDF0NWxsP0m8kzvmT30Sh1xp2t7fpqNyb4RkEm7SS5M1CVA9RnwWXVMwiwvlk
 LKkcJKKg44lvDtpOqkk4MzHADwdM8yEBmbp9lwLGhCzT0rrMmJFLsHaakWQ==
X-Received: by 2002:a05:622a:1f06:b0:4db:f0f4:9661 with SMTP id
 d75a77b69052e-4e576ad691emr146555141cf.65.1759745370162; 
 Mon, 06 Oct 2025 03:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/EFwvYFDtuXYBmDcVcbVZDXlZvHJf8WdbRFA9SctOvGp2clXL+AeK+d+ABYU0RotnUXbOKg==
X-Received: by 2002:a05:622a:1f06:b0:4db:f0f4:9661 with SMTP id
 d75a77b69052e-4e576ad691emr146554711cf.65.1759745369675; 
 Mon, 06 Oct 2025 03:09:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b011ab24fsm4891035e87.120.2025.10.06.03.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 03:09:28 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:09:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 2/7] dt-bindings: msm: dsi-controller-main: document
 the QCS8300 DSI CTRL
Message-ID: <anirh7smpjsis24pl4k4wckrimujbbodwnl67n3ipebprz673c@kdaowpncrzia>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-3-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006013924.1114833-3-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e3955b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=F4Q9eJ9c0RUMKujZamsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vpV9uPAaTX3yWqcl2UkXLwsJIIRAWnJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX0/QT8pDzzZDX
 LFi15/Up15TIlzi7gQAkV0AIZLQE0IahWoGSIlepqQ5Pp5Jp0f/RK0noNLIQDdfwhqZnJIsYH/6
 Ro4o2WWmVfyLWXSuNbPCSglbUfGeGnFJSMDD1LoahSMFGY5cj71G2PhLbARMNa8MWrRmB3t4fWs
 jGcg3pJ215JG8BpX4e/fzHhQw3O8PQwdYjXwUBZFkyAqr9hm00DjslZo14rf5WmMuq1buecquV5
 Sdxr/Qknj5/o502Gxf4y1C4fel1Lj7BX5jzE/jP7aKWFsO+5u/9RXs5AKNSBoQ5+rB9R7SjQG/a
 QQGsKDyT7UaA1i1cSEnAgcy/DPNlcKF0Eup/1UUHhOGzTHs6ERuxRXHME36M3U9R/cOiZ9QLUJk
 t8xG923JhVW1oKFzXnyBdeNTjePYew==
X-Proofpoint-ORIG-GUID: vpV9uPAaTX3yWqcl2UkXLwsJIIRAWnJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
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

On Mon, Oct 06, 2025 at 07:09:19AM +0530, Ayushi Makhija wrote:
> Document the DSI CTRL on the QCS8300 Platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 4400d4cce072..8ae08d3b0200 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -45,6 +45,11 @@ properties:
>                - qcom,sm8650-dsi-ctrl
>                - qcom,sm8750-dsi-ctrl
>            - const: qcom,mdss-dsi-ctrl
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-dsi-ctrl
> +          - const: qcom,sa8775p-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl
>        - enum:
>            - qcom,dsi-ctrl-6g-qcm2290
>            - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
> @@ -329,6 +334,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,msm8998-dsi-ctrl
> +              - qcom,qcs8300-dsi-ctrl

No need to, your compat settings already contain the sa8775p string,
which will match this clause

>                - qcom,sa8775p-dsi-ctrl
>                - qcom,sar2130p-dsi-ctrl
>                - qcom,sc7180-dsi-ctrl
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
