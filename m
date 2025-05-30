Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF65AC9668
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 22:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4DA10E22C;
	Fri, 30 May 2025 20:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfirfARK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D010E233
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 20:13:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAhHAq031510
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 20:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OadsK1rEyJ0H/6UeuCVG3zTO
 8HatytaJI7W16ZL8R1U=; b=cfirfARKU95wLmTLhM1DWv+6hCK9/XU6ApM7UDVy
 /MfEZhGslm/IOaZTSrX0RSap2IMua3gcVB8bpiQGgwIuaqWpidbq7kcSPVdtgxFe
 Q5/8GWxXK2tj0oWHgLVqg8TIzcjbyYZcp74YKStItp1gQSL43zmZb3jWvNJmY8YO
 AlwXClASF304pV8ET2tDoIN/C49C0TmXVgslCkQ+OANDjhqs91g4shygvwKBBvKL
 oOX16ZjdGC7ufWfbwWQY/oYI/6UOXDv0yuXMYuXHYpfzFqMYimp+50gefeLgBRw9
 AjJIFW/lHOULrVJ2tgGJt8gYXTv1Jv/tbi+YX7GpiHSn4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk2e8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 20:13:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c9305d29abso381421185a.1
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 13:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748635987; x=1749240787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OadsK1rEyJ0H/6UeuCVG3zTO8HatytaJI7W16ZL8R1U=;
 b=mtbq2PT8SnDPuoxU+chjHr06JpdzWU+hEKtLg7uf7y61VLrywb8WftzZdoV8nHFUDY
 WxLU7pzpef0AgXEwd8+Dg+ZWLd/k94S6lEP0gayj5cck6C3CV9wWX8mGLws2exioWcKd
 dAxpxArhhJYXk75b5LIZUROmT/e9fdSMNl8CfGSB3NYuH9xUhgzeY8orgd/B4PGXnmOp
 m9x5oXbUUItADmX1Q2wCFegCft7oxCjbo0UCzFKW0DKpXVTLDkyXwTw1lKIbpj0Svb/8
 lKGLLBbhpstxTo1+3ZN/gvqgyDNO4dWq9gQbNaAzbwjH8/2/mYgqi2jOUXNeuwwdyGI+
 54Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6DXOwX+RUNtg9myiCwLw9CGlQMf9WB3doG5h3GZXz1PhZ29wHK0GX0xF3a2R9WxWuDrpBcqhrjTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5NbM5zkyauOKGzdtf5lbUipX9WcCHqfs1YcGkM+QvPxF2uX5y
 a+eMPJo1aUVAD+dS6pNKZ/nmLfyu6UxAbV/Lm98msvbY3lZNdv33gaOUPiIMFl8hSSanOWO5eBN
 o/i1GKwpNR9m+6VvHWg44wIlkPmXwGewxa6kbT9YYS4MC795pVfD+tHzeNikZt9ArwDUKXNQ=
X-Gm-Gg: ASbGncurMET9O9pnSiyj5cPtbCw2FT6g3YPX+/oGV5/Pi2s58wQrSZNOCMs4OsUeBvc
 Npno9FcvjHBTHFTp6vPjZQV03ejkVi43uQsOUuUCGpG0+Po5rKgV5UIpUCtc13Iok+wJX05PKlI
 MWkz2reNUocFFZ6l6tfi87xk2M5J8we5CKCKmvVXyvw2msOh9dwqFA63lqcIBQtdb0oYDs7Bw46
 JYhK2UX5JGhXr4ZoAHvGui33HM8lCS1gLhZuOwut0w6/eyCM3bRqmsRknd+88jKN8UI0ZU3xAFz
 Kep00p/74LcUIWaPBHYsl3kTTr1hViMdtQzNtBVt0HIzarIdB9t3LgCASsx5i1rBhDxMsb5g7PQ
 =
X-Received: by 2002:a05:620a:2796:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7d0a2016d83mr732917385a.43.1748635987447; 
 Fri, 30 May 2025 13:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAE89MTxPgWdO4i0WDxPat+2lBREnl7QdMY9f1fr5cgF/Pe+0swZFpwTEUR+ykqh7B7ZTwzg==
X-Received: by 2002:a05:620a:2796:b0:7c5:5d4b:e62f with SMTP id
 af79cd13be357-7d0a2016d83mr732912785a.43.1748635987070; 
 Fri, 30 May 2025 13:13:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85bc507csm7159961fa.71.2025.05.30.13.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 13:13:06 -0700 (PDT)
Date: Fri, 30 May 2025 23:13:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Danila Tikhonov <danila@jiaxyga.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: add stream 1 pixel
 clock binding
Message-ID: <lrrq7cj3kw5sk7y4wjvbdvjf5qu3cwbhreod2twttvejcxtfzd@eygjcarxxd7m>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
 <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683a1154 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=s_08DJon4HIwgivb4r0A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GSfUAMziwHmy5jiFb-u3hSnZ3zBceaqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE4MCBTYWx0ZWRfX8GejkpVVulFg
 oVaghcRoEKx0N9veVhnQebEYmefp/K/yq7gydlTWhnGvBl76ELYK2vbClSeIaoxRzokB4OYzjlx
 2ZsRrZS8qfm7DExuneLiXgUCc+YIuRcGhC7rXwNmfNwwWaFSlOyiSJiTuy0pqhV84jLzHLVNbXD
 mrgdYYIMUDhpnykmuOoSbNBedlwQixTpPr5uoGgTCflHbhNhlCLrvVo+cV+fKfiMnEe2yyPqhtS
 SNbRV+vl/J9Bve63tKNStUJdI+v03iko99AW+v/ZLsoBjBMgFRDY7Esuz/hCwrgPSQaMO5bBBjf
 xJfdPK+6rtGQ5+Oefe0spYt4AwG10ZYviz3Q9pW7UcGnt1PKKFTp1qTf8GrvZ1usulHiLKI9p1P
 yXRbbv3uAdudoZUiq6SSaRaDxTbJv3l+2zM39U4HG9K0NPiEosRVF/GX3YBh8VClgxKJiRe4
X-Proofpoint-GUID: GSfUAMziwHmy5jiFb-u3hSnZ3zBceaqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300180
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

On Fri, May 30, 2025 at 10:47:27AM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> To support MST on such chipsets, add the binding for stream 1 pixel
> clock for display port controller.

If I remember correctly, some of these chipsets support more than 2 MST
streams, which means more than 1 additional pixel clock. Could you
please clarify this?

If so, can we please describe all clocks, so that we don't have to
return back to the topic.

> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 ++++++++++++++++++++--
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  9 ++++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  9 ++++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  5 files changed, 56 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index a63efd8de42c..81ffc141e00d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -54,25 +54,31 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
> -      - description: Display Port Pixel clock
> +      - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
>  
>    assigned-clocks:
> +    minItems: 2
>      items:
>        - description: link clock source
> -      - description: pixel clock source
> +      - description: stream 0 pixel clock source
> +      - description: stream 1 pixel clock source
>  
>    phys:
>      maxItems: 1
> @@ -174,6 +180,32 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-dp
> +              - qcom,sm8150-dp
> +              - qcom,sc8180x-dp
> +              - qcom,sc8280xp-dp
> +              - qcom,sm8350-dp
> +              - qcom,sm8450-dp
> +              - qcom,sm8650-dp
> +              - qcom,sa8775p-dp
> +              - qcom,x1e80100-dp

Let's get this list sorted alphabetically. Also, do we need to list all
those entries? Some of those use fallback compatible to qcom,sm8350-dp,
so it should be enough to list just that entry for those.

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          maxItems: 6
> +
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
>  additionalProperties: false
>  
>  examples:

-- 
With best wishes
Dmitry
