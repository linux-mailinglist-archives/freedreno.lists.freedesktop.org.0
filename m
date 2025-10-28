Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34037C16B39
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 21:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0987610E06E;
	Tue, 28 Oct 2025 20:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzycHZfy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g657usWi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E806D10E06E
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 20:00:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlsi62553759
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 20:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=V4roZFbJyz4h3LTg3OYpA/rr
 jgxznf7XEnG0CMcM7Z4=; b=FzycHZfynrd35FGtx+2WJpQ3s9APtJZESicJKxHF
 2uKj3LpBadHCj8Yvf9aQjS39nZKVKdXwyFCYOhs1dlp/99lSNRgO5ymcNCFDTmT5
 hBy/FGHn0j/kppmpceiujkfCXT0cOCqh27p6jwpgl1IUzh+U7KjHBix7w/oRd6c+
 N/60sgCzSylbB2wtGCtuXzEQ0JmS0b8dC5/Hweg2UGZOZIfBG5JlE5wr9GNapDPw
 x4BkBC98mmhMpUIOEn9VUt6h2jFDD9WVMSt4F9hp4gn2IkE6jrVGA+sdg+o3AV4i
 zLj+yifHnwmsVJGB3QNsZvf/tK5vEADGvYEwj+yszjyFkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2g0tw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 20:00:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4eceefa36d0so104687171cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681607; x=1762286407;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V4roZFbJyz4h3LTg3OYpA/rrjgxznf7XEnG0CMcM7Z4=;
 b=g657usWiSezpWLb7EWChLUVaMgr2wXcqo9en6khHqUU0kdPNUQwAoTf2l4HaKErr4p
 D9LPCn4CyQWvg4Tc84qiRdL5WVxa3MxIAGBFZHskCu//Ooqf/OOb2WCeJfvs781ftrIb
 XXErWYdCvKV0q/YDmuSdfl9Zli/vW/5MfqMh28CFEiGbfrNV0xPYRBkCTl4psRcBVKLu
 Pq1gkOU3iq6K/5rdtihhK3ssXcqvOrsw1VxyuP7cPAcy6lzQvr/YXVco22XjVNgJXorg
 QbMs9TegCh0m7LHiDxJ9sdBs4uv47otCuwa71WZ7VcrbDoPB4cyvIGQjrp0JM/L84M8Z
 1h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681607; x=1762286407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4roZFbJyz4h3LTg3OYpA/rrjgxznf7XEnG0CMcM7Z4=;
 b=K2BnCWJUBkaA0e9oNrG7attC6/rvHuAX3U7WLMRTXffokScHNHn0D4Q7Juf3n83NP/
 LIkXbl9J8DfKXAJfOFHXhQ7DfGT1Qj3JVsp3HXn/5XPC0tCiCZdLK0hnC+6AJAW2v2Gp
 OlEV+QxfI8Fy/cHMkgsv8lerFBsyspc55+FR/OGM0zxKWGl7okY0rhGEyVoXMBHz7lZy
 rA7pf9jkA4hSA2LP/UdJGy3A4uX1NESC/6BIU+aKpeopt29wpr96yqMViVAOLKKLBxst
 V7HaJupdfdBp9/IL4jgBcwNRs7wmmjO5/JaOZ8OpW03Tg0zIjgdfXBxXtDxNBDQolkvw
 DzHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMHAAvKUSRuR1ymRZggP0ms+911KOj9oG3Wlu2qH6/9M0BLCjCtr/QMetI3aVchTf4r9CO3OX0hq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOH3G0NpL2p3NQGukydVN2WW23ek5abVczwTvnqWhrJTikaGVV
 MyqOk5fEFofdzQ1W0pyZY7RM/4Yn8Wgie3joTYgLGcgYmIZTHhXuOIHk2TAt3jQsqFWQfSIdhte
 npsZW2lClYycfbWSV74BE4g2AQdDHo0SsYgYxnFQkKIqy5yoGpMMZN+hmuNUcfB58XNXttvE=
X-Gm-Gg: ASbGncuX3B0CIkjH78AZ7nefaulGM+xMd81m/aStbTTa/GDqay+D0v1XtuQb5oWD6Ti
 vg4VSq8lPESDh6HD1qfQa6jK0vl5QvRaQkkU+IQ0O6GgtLwfPDDd748k7hFMv7VcDLRtMiQtTOJ
 TdJcrsSVr7oyP9kvfcRXT2nR0RtHOg2bgQNw3XPmCFce6r5TnQGUKXNJZdistR50cvaDkpApdaq
 o5YzFDepzjA7sH/NB8k/Lxv+2hGsZ+djel5ZR9Ss5JzgJ6OlIa0/mzEXwguCx+ciOSRjQ0FymNF
 Ozr0eZRucGLxWpowgwwMAcCDEqCgAg2R+uL0aDIf7HLTL2UdWIYv65J6GLEGFhwPNzL3W+BjqyS
 xp1a58GJ0vKH6PIFjAl3Y0Wc3zcZK9+Q1ge1pzxXfvDmtvipfM/lPI/YMOHujl3sZvPMqebw2pV
 1bI3/p7gHEsJ5f
X-Received: by 2002:ac8:58c8:0:b0:4ed:68a:abba with SMTP id
 d75a77b69052e-4ed15b7dad0mr5278151cf.37.1761681607320; 
 Tue, 28 Oct 2025 13:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW5aQI+Mi4P7TXLTknhsG3o08YzSTL6vg6PtZtW0JsBzmgyHQTV0m7A4A017Zn2nx/4LIdQA==
X-Received: by 2002:ac8:58c8:0:b0:4ed:68a:abba with SMTP id
 d75a77b69052e-4ed15b7dad0mr5277611cf.37.1761681606708; 
 Tue, 28 Oct 2025 13:00:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f5c33dsm3249487e87.53.2025.10.28.13.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 13:00:06 -0700 (PDT)
Date: Tue, 28 Oct 2025 22:00:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 2/4] dt-bindings: display: msm: sm6150-mdss: Fix
 example indentation and OPP values
Message-ID: <ggrtehmzg5bajbglcjhlf5jynhwqq6vztc2fqwxxgip2q3vmip@t72qcggza2or>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-add-displayport-support-to-qcs615-devicetree-v6-2-c4316975dd0e@oss.qualcomm.com>
X-Proofpoint-GUID: f5SBHnEWHU-LhznfLHDpt3kR9Z4WpS4y
X-Proofpoint-ORIG-GUID: f5SBHnEWHU-LhznfLHDpt3kR9Z4WpS4y
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=690120c8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oTxB0LKMmMN85w47ZbAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2OCBTYWx0ZWRfXySSdrtVlanla
 imMYzk0t5JJGrwSrH4KetL9iEG3D5/WHDavq975maPeGa8bJhqKQnzSCmDKOK4N7eHxZLOLe4ph
 dF8McT/Ow5duqTt/zQ1xGZHP030S2uWIhgO2d+YQ2EEZvRW6NrGltAo7CaRgQNgUagKIbf0G40Z
 m/8nieD2cyGi+GU4pwVdUGDD+YcaNfFz1FIDjagNNmMCXrUbT2ksoANGZqAhTLtc/ThmjXKqPK9
 mRODUnDbaDrV4rQtF0PhSVdRJz6yndE+CdP9oGDd26bnonNPFheiKuluVbIbvYhpjCUhbfsUX4r
 lrsCIQsVWw1nGMmCp3TncnNlegShWNrVWIEfHzwOtNCIIFo2YSOP03oAzXK4Z+wonrkWdWXEEs9
 I1FE5J9XvpM87BupjIRd7WOHVemAKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280168
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

On Fri, Oct 24, 2025 at 01:21:02PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> - Adjusted indentation and added missing blank lines in the example.
> - Corrected OPP clock values to match actual DTS configuration.

See Documentation/process/submitting-patches.rst to check how to write
proper commit messages.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 32 ++++++++++++----------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> index ba0dea2edea98cee0826cf38b3f33361666e004a..80183df71cd9288f652dc42afeae101e8edcbe65 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> @@ -140,35 +140,37 @@ examples:
>                  #size-cells = <0>;
>  
>                  port@0 {
> -                  reg = <0>;
> -                  dpu_intf0_out: endpoint {
> -                  };
> +                    reg = <0>;
> +
> +                    dpu_intf0_out: endpoint {
> +                    };
>                  };
>  
>                  port@1 {
> -                  reg = <1>;
> -                  dpu_intf1_out: endpoint {
> -                      remote-endpoint = <&mdss_dsi0_in>;
> -                  };
> +                    reg = <1>;
> +
> +                    dpu_intf1_out: endpoint {
> +                        remote-endpoint = <&mdss_dsi0_in>;
> +                    };
>                  };
>              };
>  
>              mdp_opp_table: opp-table {
>                  compatible = "operating-points-v2";
>  
> -                opp-19200000 {
> -                  opp-hz = /bits/ 64 <19200000>;
> -                  required-opps = <&rpmhpd_opp_low_svs>;
> +                opp-192000000 {

This is not necessary. This is just an example, so it doesn't matter,
which values are actually written here.

> +                    opp-hz = /bits/ 64 <192000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
>                  };
>  
> -                opp-25600000 {
> -                  opp-hz = /bits/ 64 <25600000>;
> -                  required-opps = <&rpmhpd_opp_svs>;
> +                opp-256000000 {
> +                    opp-hz = /bits/ 64 <256000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
>                  };
>  
>                  opp-307200000 {
> -                  opp-hz = /bits/ 64 <307200000>;
> -                  required-opps = <&rpmhpd_opp_nom>;
> +                    opp-hz = /bits/ 64 <307200000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
>                  };
>              };
>          };
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
